package com.flange.store.console.service;

import com.flange.store.model.OmsOrderSetting;

/**
 * @author flangely
 * @create 2019-04-15
 * <p> 订单设置Service
 * 10:18 AM
 */
public interface OmsOrderSettingService {

    /**
     * 获取指定订单设置
     */
    OmsOrderSetting getItem(String id);

    /**
     * 修改指定订单设置
     */
    int update(String id, OmsOrderSetting orderSetting);

}
