package com.flange.store.portal.service;

import com.flange.store.portal.domain.CommonResult;
import com.flange.store.portal.domain.ConfirmOrderResult;
import com.flange.store.portal.domain.OrderParam;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author flangely
 * @create 2019-04-20
 * <p>前台订单管理
 * 2:08 PM
 */
public interface OmsPortalOrderService {

    /**
     * 根据用户购物车信息生成确认单信息
     */
    ConfirmOrderResult generateConfirmOrder(List<String> ids);

    /**
     * 根据提交信息生成订单
     */
    @Transactional
    CommonResult generateOrder(OrderParam orderParam, List<String> ids);

    /**
     * 支付成功后的回调
     */
    @Transactional
    CommonResult paySuccess(String orderId);

    /**
     * 自动取消超时订单
     */
    @Transactional
    CommonResult cancelTimeOutOrder();

    /**
     * 取消单个超时订单
     */
    @Transactional
    void cancelOrder(String orderId);

    /**
     * 发送延迟消息取消订单
     */
    void sendDelayMessageCancelOrder(String orderId);
}
