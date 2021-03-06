package com.flange.store.portal.controller;

import com.flange.store.model.UmsMember;
import com.flange.store.portal.domain.CommonResult;
import com.flange.store.portal.domain.ConfirmOrderResult;
import com.flange.store.portal.domain.OmsOrderDetail;
import com.flange.store.portal.domain.OrderParam;
import com.flange.store.portal.service.OmsPortalOrderService;
import com.flange.store.portal.service.UmsMemberService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;
import java.util.stream.Collector;
import java.util.stream.Collectors;

/**
 * @author flangely
 * @create 2019-04-21
 * <p>
 * 10:06 AM
 */
@Controller
@Api(tags = "OmsPortalOrderController",description = "订单管理")
@RequestMapping("/order")
public class OmsPortalOrderController {
    @Autowired
    private OmsPortalOrderService portalOrderService;

    @Autowired
    private UmsMemberService memberService;


    @ApiOperation("根据购物车信息生成确认单信息")
    @RequestMapping(value = "/generateConfirmOrder",method = RequestMethod.POST)
    @ResponseBody
    public Object generateConfirmOrder(@RequestBody Map map){
        List<Object> objectList = (List<Object>) map.get("cartItemIds");
        List<String> cartItemIds = objectList.stream().map(value -> value.toString()).collect(Collectors.toList());
        ConfirmOrderResult confirmOrderResult = portalOrderService.generateConfirmOrder(cartItemIds);
        return new CommonResult().success(confirmOrderResult);
    }

    @ApiOperation("根据购物车信息生成订单")
    @RequestMapping(value = "/generateOrder",method = RequestMethod.POST)
    @ResponseBody
    public Object generateOrder(@RequestBody OrderParam orderParam){
        return portalOrderService.generateOrder(orderParam, orderParam.getCartItemIds());
    }
    @ApiOperation("支付成功的回调")
    @RequestMapping(value = "/paySuccess",method = RequestMethod.POST)
    @ResponseBody
    public Object paySuccess(@RequestParam String orderId, @RequestParam Integer payType){
        return portalOrderService.paySuccess(orderId, payType);
    }

    @ApiOperation("取消订单")
    @RequestMapping(value = "/cancelTimeOutOrder",method = RequestMethod.POST)
    @ResponseBody
    public Object cancelTimeOutOrder(){
        return portalOrderService.cancelTimeOutOrder();
    }

    @ApiOperation("取消单个订单")
    @RequestMapping(value = "/cancelOrder",method = RequestMethod.POST)
    @ResponseBody
    public Object cancelOrder(String orderId){
        portalOrderService.sendDelayMessageCancelOrder(orderId);
        return new CommonResult().success(null);
    }

    @ApiOperation("获取会员订单")
    @RequestMapping(value = "/list",method = RequestMethod.GET)
    @ResponseBody
    public Object getMemberOrder(){
        UmsMember member = memberService.getCurrentMember();
        List<OmsOrderDetail> list = portalOrderService.getMemberOrderList(member.getId());
        return new CommonResult().success(list);
    }

    @ApiOperation("关闭订单")
    @RequestMapping(value = "/cancelMyOrder",method = RequestMethod.POST)
    @ResponseBody
    public Object calOrder(@RequestParam String id){
        UmsMember member = memberService.getCurrentMember();
        int count = 0;
        portalOrderService.cancelOrder(id);
        count = 1;
        return  new CommonResult().success(count);
    }

    @ApiOperation("删除订单")
    @RequestMapping(value = "/delMyOrder",method = RequestMethod.DELETE)
    @ResponseBody
    public Object deleteStatusOrder(@RequestParam String id){
        UmsMember member = memberService.getCurrentMember();
        int count = portalOrderService.changeDelStatus(id);
        return  new CommonResult().success(count);
    }

    @ApiOperation("确认收货")
    @RequestMapping(value = "/confirmReceive",method = RequestMethod.PUT)
    @ResponseBody
    public Object confirmReceive(@RequestParam String id){
        UmsMember member = memberService.getCurrentMember();
        int count = portalOrderService.confirmOrderReceive(id);
        return  new CommonResult().success(count);
    }


}
