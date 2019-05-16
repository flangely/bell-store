package com.flange.store.console.service.impl;

import com.flange.store.console.dao.OmsOrderReturnApplyDao;
import com.flange.store.console.dto.OmsOrderReturnApplyResult;
import com.flange.store.console.dto.OmsReturnApplyQueryParam;
import com.flange.store.console.dto.OmsUpdateStatusParam;
import com.flange.store.console.service.OmsOrderReturnApplyService;
import com.flange.store.mapper.OmsOrderItemMapper;
import com.flange.store.mapper.OmsOrderMapper;
import com.flange.store.mapper.OmsOrderReturnApplyMapper;
import com.flange.store.mapper.PmsProductMapper;
import com.flange.store.model.*;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

/**
 * @author flangely
 * @create 2019-03-17
 * <p>订单退货管理Service
 * 9:41 AM
 */
@Service
public class OmsOrderReturnApplyServiceImpl implements OmsOrderReturnApplyService {
    @Autowired
    private OmsOrderReturnApplyDao returnApplyDao;
    @Autowired
    private OmsOrderReturnApplyMapper returnApplyMapper;

    @Autowired
    private OmsOrderMapper orderMapper;

    @Autowired
    private OmsOrderItemMapper orderItemMapper;

    @Autowired
    private PmsProductMapper productMapper;
    @Override
    public List<OmsOrderReturnApply> list(OmsReturnApplyQueryParam queryParam, Integer pageSize, Integer pageNum) {
        PageHelper.startPage(pageNum,pageSize);
        return returnApplyDao.getList(queryParam);
    }

    @Override
    public int delete(List<String> ids) {
        OmsOrderReturnApplyExample example = new OmsOrderReturnApplyExample();
        example.createCriteria().andIdIn(ids).andStatusEqualTo(3);
        return returnApplyMapper.deleteByExample(example);
    }

    @Override
    public int updateStatus(String id, OmsUpdateStatusParam statusParam) {
        Integer status = statusParam.getStatus();
        OmsOrderReturnApply current = returnApplyMapper.selectByPrimaryKey(id);
        OmsOrder order = new OmsOrder();
        order.setId(current.getOrderId());
        OmsOrderReturnApply returnApply = new OmsOrderReturnApply();
        if(status.equals(1)){
            //确认退货
            returnApply.setId(id);
            returnApply.setStatus(1);
            returnApply.setReturnAmount(statusParam.getReturnAmount());
            returnApply.setCompanyAddressId(statusParam.getCompanyAddressId());
            returnApply.setHandleTime(new Date());
            returnApply.setHandleMan(statusParam.getHandleMan());
            returnApply.setHandleNote(statusParam.getHandleNote());
            order.setStatus(6);
        }else if(status.equals(2)){
            //完成退货
            returnApply.setId(id);
            returnApply.setStatus(2);
            returnApply.setReceiveTime(new Date());
            returnApply.setReceiveMan(statusParam.getReceiveMan());
            returnApply.setReceiveNote(statusParam.getReceiveNote());
            order.setStatus(7);
            //恢复库存
            addQuantity(order.getId());
        }else if(status.equals(3)){
            //拒绝退货
            returnApply.setId(id);
            returnApply.setStatus(3);
            returnApply.setHandleTime(new Date());
            returnApply.setHandleMan(statusParam.getHandleMan());
            returnApply.setHandleNote(statusParam.getHandleNote());
            order.setStatus(8);
        }else{
            return 0;
        }
        orderMapper.updateByPrimaryKeySelective(order);
        return returnApplyMapper.updateByPrimaryKeySelective(returnApply);
    }

    @Override
    public OmsOrderReturnApplyResult getItem(String id) {
        return returnApplyDao.getDetail(id);
    }

    public void addQuantity(String orderId){
        //查询为付款的取消订单
        OmsOrderExample example = new OmsOrderExample();
        example.createCriteria().andIdEqualTo(orderId).andDeleteStatusEqualTo(0);
        List<OmsOrder> orderList = orderMapper.selectByExample(example);
        if(CollectionUtils.isEmpty(orderList)){
            return;
        }
        OmsOrder cancelOrder = orderList.get(0);
        if(cancelOrder!=null){

            OmsOrderItemExample orderItemExample=new OmsOrderItemExample();
            orderItemExample.createCriteria().andOrderIdEqualTo(orderId);
            List<OmsOrderItem> orderItemList = orderItemMapper.selectByExample(orderItemExample);
            //解除订单商品库存锁定
            List<String> orderProductIdList = orderItemList.stream().map(item -> item.getProductId()).collect(Collectors.toList());
            List<PmsProduct> orderProductList = getOrderProduct(orderProductIdList);
            increaseStock(orderItemList, orderProductList);
        }
    }

    private List<PmsProduct> getOrderProduct(List<String> productIdList){
        PmsProductExample example = new PmsProductExample();
        example.createCriteria().andIdIn(productIdList);
        List<PmsProduct> selectedProductList = productMapper.selectByExample(example);
        return selectedProductList;
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
}
