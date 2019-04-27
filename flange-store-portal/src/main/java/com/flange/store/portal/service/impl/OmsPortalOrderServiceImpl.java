package com.flange.store.portal.service.impl;

import com.flange.store.mapper.*;
import com.flange.store.model.*;
import com.flange.store.portal.component.CancelOrderSender;
import com.flange.store.portal.dao.PortalOrderDao;
import com.flange.store.portal.dao.PortalOrderItemDao;
import com.flange.store.portal.domain.CommonResult;
import com.flange.store.portal.domain.ConfirmOrderResult;
import com.flange.store.portal.domain.OmsOrderDetail;
import com.flange.store.portal.domain.OrderParam;
import com.flange.store.portal.service.*;
import com.flange.store.util.IdUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.stream.Collectors;

/**
 * @author flangely
 * @create 2019-04-20
 * <p>
 * 2:11 PM
 */
@Service
public class OmsPortalOrderServiceImpl implements OmsPortalOrderService {


    @Autowired
    private UmsMemberService memberService;

    @Autowired
    private UmsMemberReceiveAddressService memberReceiveAddressService;

    @Autowired
    private OmsCartItemMapper cartItemMapper;

    @Autowired
    private OmsCartItemService cartItemService;

    @Autowired
    private PmsProductMapper productMapper;

    @Autowired
    private OmsOrderMapper orderMapper;

    @Autowired
    private RedisService redisService;

    @Value("${redis.key.prefix.orderId}")
    private String REDIS_KEY_PREFIX_ORDER_ID;

    @Autowired
    private OmsOrderSettingMapper orderSettingMapper;

    @Autowired
    private PortalOrderDao portalOrderDao;

    @Autowired
    private OmsOrderItemMapper orderItemMapper;

    @Autowired
    private PortalOrderItemDao orderItemDao;

    @Autowired
    private CancelOrderSender cancelOrderSender;

    @Override
    public ConfirmOrderResult generateConfirmOrder(List<String> ids) {
        ConfirmOrderResult result = new ConfirmOrderResult();
        UmsMember member = memberService.getCurrentMember();
        //获取购物车中所有选中的Item
        List<OmsCartItem> selectCartItem = getSelectCartItem(ids, member.getId());
        //获取用户收货地址列表
        List<UmsMemberReceiveAddress> memberReceiveAddressList = memberReceiveAddressService.list();
        result.setMemberReceiveAddressList(memberReceiveAddressList);
        //计算商品价格和运费
        result.setCalcAmount(calcCartAmount(selectCartItem));
        return result;
    }

    @Override
    public CommonResult generateOrder(OrderParam orderParam, List<String> ids) {
        List<OmsOrderItem> orderItemList = new ArrayList<>();
        UmsMember currentMember = memberService.getCurrentMember();
        //获取购物车中所有选中的Item
        List<OmsCartItem> selectedCartItem = getSelectCartItem(ids, currentMember.getId());
        for (OmsCartItem cartItem : selectedCartItem){
            //生成下单商品信息
            OmsOrderItem orderItem = new OmsOrderItem();
            orderItem.setProductId(cartItem.getProductId());
            orderItem.setProductName(cartItem.getProductName());
            orderItem.setProductPic(cartItem.getProductPic());
            orderItem.setProductAttr(cartItem.getProductAttr());
            orderItem.setProductBrand(cartItem.getProductBrand());
            orderItem.setProductSn(cartItem.getProductSn());
            orderItem.setProductPrice(cartItem.getPrice());
            orderItem.setProductQuantity(cartItem.getQuantity());
            orderItem.setProductSkuId(cartItem.getProductSkuId());
            orderItem.setProductSkuCode(cartItem.getProductSkuCode());
            orderItem.setProductCategoryId(cartItem.getProductCategoryId());
            orderItemList.add(orderItem);
        }
        List<String> productIdList = selectedCartItem.stream().map(item -> item.getProductId()).collect(Collectors.toList());
        List<PmsProduct> selectedProductList = getOrderProduct(productIdList);
        if (!hasStock(selectedCartItem, selectedProductList)){
            return new CommonResult().failed("库存不足，无法下单");
        }
        //减少商品库存
        reduceStock(orderItemList, selectedProductList);
        //根据商品合计、运费计算应付金额
        OmsOrder order = new OmsOrder();
        order.setDiscountAmount(new BigDecimal(0));
        BigDecimal totalAmount = calcTotalAmount(orderItemList);
        order.setTotalAmount(totalAmount);
        order.setFreightAmount(new BigDecimal(5));
        order.setPayAmount(totalAmount);
        //转化为订单信息并插入数据库
        order.setMemberId(currentMember.getId());
        order.setCreateTime(new Date());
        order.setMemberUsername(currentMember.getUserName());
        //支付方式：0->未支付；1->支付宝；2->微信
        order.setPayType(orderParam.getPayType());
        //订单来源：0->PC订单；1->app订单
        order.setSourceType(0);
        //订单状态：0->待付款；1->待发货；2->已发货；3->已完成；4->已关闭；5->无效订单
        order.setStatus(0);
        //收货人信息：姓名、电话、邮编、地址
        UmsMemberReceiveAddress address = memberReceiveAddressService.getItem(orderParam.getMemberReceiveAddressId());
        order.setReceiverName(address.getName());
        order.setReceiverPhone(address.getPhoneNumber());
        order.setReceiverPostCode(address.getPostCode());
        order.setReceiverProvince(address.getProvince());
        order.setReceiverCity(address.getCity());
        order.setReceiverRegion(address.getRegion());
        order.setReceiverDetailAddress(address.getDetailAddress());
        //0->未确认；1->已确认
        order.setConfirmStatus(0);
        order.setDeleteStatus(0);
        order.setId(IdUtil.getOrderId());
        //生成订单号
        order.setOrderSn(generateOrderSn(order));
        // TODO: 2018/9/3 bill_*,delivery_*
        //插入order表和order_item表
        orderMapper.insert(order);
        for (OmsOrderItem orderItem : orderItemList) {
            orderItem.setId(IdUtil.getGeneralID());
            orderItem.setOrderId(order.getId());
            orderItem.setOrderSn(order.getOrderSn());
        }
        //保存订单商品信息
        orderItemDao.insertList(orderItemList);
        //删除购物车中的下单商品
//        deleteCartItemList(selectedCartItem,currentMember);
        cartItemService.delete(currentMember.getId(),selectedCartItem.stream().map(val -> val.getId()).collect(Collectors.toList()));
        Map<String,Object> result = new HashMap<>();
        result.put("order",order);
        result.put("orderItemList",orderItemList);
        return new CommonResult().success("下单成功", result);
    }

    @Override
    public CommonResult paySuccess(String orderId, Integer payType) {
        //修改订单支付状态
        OmsOrder order = new OmsOrder();
        order.setId(orderId);
        order.setStatus(1);
        order.setPaymentTime(new Date());
        order.setPayType(payType);
        int count = orderMapper.updateByPrimaryKeySelective(order);
        return new CommonResult().success("支付成功",count);
    }

    @Override
    public CommonResult cancelTimeOutOrder() {

        OmsOrderSetting orderSetting = orderSettingMapper.selectByPrimaryKey("1");
        //查询超时、未支付的订单及订单详情
        List<OmsOrderDetail> timeOutOrders = portalOrderDao.getTimeOutOrders(orderSetting.getNormalOrderOvertime());
        if(CollectionUtils.isEmpty(timeOutOrders)){
            return new CommonResult().failed("暂无超时订单");
        }
        //修改订单状态为交易取消
        List<String> ids = new ArrayList<>();
        for (OmsOrderDetail timeOutOrder : timeOutOrders) {
            ids.add(timeOutOrder.getId());
        }
        portalOrderDao.updateOrderStatus(ids,4);
        //订单取消后库存增加
        for (OmsOrderDetail timeOutOrder : timeOutOrders) {
            List<String> orderProductIdList = timeOutOrder.getOrderItemList().stream().map(item -> item.getProductId()).collect(Collectors.toList());
            List<PmsProduct> orderProductList = getOrderProduct(orderProductIdList);
            increaseStock(timeOutOrder.getOrderItemList(), orderProductList);
        }
        return new CommonResult().success(null);
    }

    @Override
    public void cancelOrder(String orderId) {
        //查询为付款的取消订单
        OmsOrderExample example = new OmsOrderExample();
        example.createCriteria().andIdEqualTo(orderId).andStatusEqualTo(0).andDeleteStatusEqualTo(0);
        List<OmsOrder> cancelOrderList = orderMapper.selectByExample(example);
        if(CollectionUtils.isEmpty(cancelOrderList)){
            return;
        }
        OmsOrder cancelOrder = cancelOrderList.get(0);
        if(cancelOrder!=null){
            //修改订单状态为取消
            cancelOrder.setStatus(4);
            orderMapper.updateByPrimaryKeySelective(cancelOrder);
            OmsOrderItemExample orderItemExample=new OmsOrderItemExample();
            orderItemExample.createCriteria().andOrderIdEqualTo(orderId);
            List<OmsOrderItem> orderItemList = orderItemMapper.selectByExample(orderItemExample);
            //解除订单商品库存锁定
            List<String> orderProductIdList = orderItemList.stream().map(item -> item.getProductId()).collect(Collectors.toList());
            List<PmsProduct> orderProductList = getOrderProduct(orderProductIdList);
            increaseStock(orderItemList, orderProductList);
        }
    }

    @Override
    public void sendDelayMessageCancelOrder(String orderId) {
        //获取订单超时时间
        OmsOrderSetting orderSetting = orderSettingMapper.selectByPrimaryKey("1");
        long delayTimes = orderSetting.getNormalOrderOvertime()*60*1000;
        //发送延迟消息
        cancelOrderSender.sendMessage(orderId,delayTimes);
    }

    @Override
    public List<OmsOrderDetail> getMemberOrderList(String memberId) {
        return portalOrderDao.getMemberOrderList(memberId);
    }

    @Override
    public int changeDelStatus(String id) {
        OmsOrder order = new OmsOrder();
        order.setId(id);
        order.setDeleteStatus(1);
        return orderMapper.updateByPrimaryKeySelective(order);
    }


    /**
     * 生成18位订单编号:8位日期+2位平台号码+2位支付方式+6位以上自增id
     */
    private String generateOrderSn(OmsOrder order) {
        StringBuilder sb = new StringBuilder();
        String date = new SimpleDateFormat("yyyyMMdd").format(new Date());
        String key = REDIS_KEY_PREFIX_ORDER_ID + date;
        Long increment = redisService.increment(key, 1);
        sb.append(date);
        sb.append(String.format("%02d",order.getSourceType()));
        sb.append(String.format("%02d",order.getPayType()));
        String incrementStr = increment.toString();
        if(incrementStr.length()<=6){
            sb.append(String.format("%06d",increment));
        }else{
            sb.append(incrementStr);
        }
        return sb.toString();
    }

    /**
     * 减少商品库存
     * @param orderItemList
     * @param selectedProductList
     */
    private void reduceStock(List<OmsOrderItem> orderItemList, List<PmsProduct> selectedProductList){

        for (OmsOrderItem orderItem : orderItemList){
            for (PmsProduct oldProduct : selectedProductList){
                if (oldProduct.getId().equals(orderItem.getProductId())){
                    PmsProduct product = new PmsProduct();
                    product.setId(oldProduct.getId());
                    product.setStock(oldProduct.getStock() - orderItem.getProductQuantity());
                    productMapper.updateByPrimaryKeySelective(product);
                }
            }
        }


    }

    /**
     * 订单取消后增加商品库存
     * @param orderItemList
     * @param selectedProductList
     */
    private void increaseStock(List<OmsOrderItem> orderItemList, List<PmsProduct> selectedProductList){

        for (OmsOrderItem orderItem : orderItemList){
            for (PmsProduct oldProduct : selectedProductList){
                if (oldProduct.getId().equals(orderItem.getProductId())){
                    PmsProduct product = new PmsProduct();
                    product.setId(oldProduct.getId());
                    product.setStock(oldProduct.getStock() + orderItem.getProductQuantity());
                    productMapper.updateByPrimaryKeySelective(product);
                }
            }

        }


    }



    private void deleteCartItemList(List<OmsCartItem> cartItemList, UmsMember currentMember){
        List<String> ids = new ArrayList<>();
        for (OmsCartItem cartItem: cartItemList){
            ids.add(cartItem.getId());
        }
        cartItemService.changeStatus(currentMember.getId(), ids);
    }


    /**
     * 计算总金额
     */
    private BigDecimal calcTotalAmount(List<OmsOrderItem> orderItemList) {
        BigDecimal totalAmount = new BigDecimal("0");
        for (OmsOrderItem item : orderItemList) {
            totalAmount = totalAmount.add(item.getProductPrice().multiply(new BigDecimal(item.getProductQuantity())));
        }
        return totalAmount;
    }


    /**
     * 判断下单商品是否都有库存
     */
    private boolean hasStock(List<OmsCartItem> cartItemList, List<PmsProduct> selectedProductList) {

        for (OmsCartItem cartItem : cartItemList){
            for (PmsProduct product : selectedProductList){
                if (product.getStock() < cartItem.getQuantity()){//购物车商品数量大于库存
                    return false;
                }
            }
        }
        return true;
    }


    private List<PmsProduct> getOrderProduct(List<String> productIdList){
        PmsProductExample example = new PmsProductExample();
        example.createCriteria().andIdIn(productIdList);
        List<PmsProduct> selectedProductList = productMapper.selectByExample(example);
        return selectedProductList;
    }



    /**
     * 获取购物车中已选中的商品
     * @param ids
     * @param memberId
     * @return
     */
    private List<OmsCartItem> getSelectCartItem(List<String> ids, String memberId){
        OmsCartItemExample example = new OmsCartItemExample();
        example.createCriteria().andIdIn(ids).andMemberIdEqualTo(memberId);
        return cartItemMapper.selectByExample(example);
    }

    /**
     * 计算购物车中商品的价格
     */
    private ConfirmOrderResult.CalcAmount calcCartAmount(List<OmsCartItem> cartItemList) {
        ConfirmOrderResult.CalcAmount calcAmount = new ConfirmOrderResult.CalcAmount();
        //运费暂时全部为5元
        BigDecimal freightAmount = new BigDecimal(5);
        BigDecimal totalAmount = new BigDecimal(0);
        BigDecimal promotionAmount = new BigDecimal(0);
        BigDecimal payAmount;
        for (OmsCartItem cartItem : cartItemList){
            totalAmount = totalAmount.add(cartItem.getPrice().multiply(new BigDecimal(cartItem.getQuantity())));
        }
        payAmount = totalAmount.add(freightAmount);
        calcAmount.setTotalAmount(totalAmount);
        calcAmount.setPromotionAmount(promotionAmount);
        calcAmount.setPayAmount(payAmount);
        calcAmount.setFreightAmount(freightAmount);
        return calcAmount;
    }
}
