package com.flange.store.portal.component;

import com.flange.store.portal.domain.CommonResult;
import com.flange.store.portal.service.OmsPortalOrderService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

/**
 * @author flangely
 * @create 2019-04-21
 * <p> 订单超时自动取消并更新商品存库
 * 10:58 AM
 */
@Component
public class OrderTimeOutCancelTask {
    private Logger LOGGER = LoggerFactory.getLogger(OrderTimeOutCancelTask.class);
    @Autowired
    private OmsPortalOrderService portalOrderService;

    /**
     * cron表达式：Seconds Minutes Hours DayofMonth Month DayofWeek [Year]
     * 每10分钟扫描一次，扫描设定超时时间之前下的订单，如果没支付则取消该订单
     */
    @Scheduled(cron = "0 0/10 * ? * ?")
    private void cancelTimeOutOrder(){
        CommonResult result = portalOrderService.cancelTimeOutOrder();
        LOGGER.info("取消订单，并更新商品库存:{}",result);
    }
}
