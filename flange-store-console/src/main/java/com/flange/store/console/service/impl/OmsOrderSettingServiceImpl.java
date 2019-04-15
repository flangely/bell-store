package com.flange.store.console.service.impl;

import com.flange.store.console.service.OmsOrderSettingService;
import com.flange.store.mapper.OmsOrderSettingMapper;
import com.flange.store.model.OmsOrderSetting;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author flangely
 * @create 2019-04-15
 * <p>
 * 10:19 AM
 */

@Service
public class OmsOrderSettingServiceImpl implements OmsOrderSettingService {

    @Autowired
    private OmsOrderSettingMapper orderSettingMapper;

    @Override
    public OmsOrderSetting getItem(String id) {
        return orderSettingMapper.selectByPrimaryKey(id);
    }

    @Override
    public int update(String id, OmsOrderSetting orderSetting) {
        orderSetting.setId(id);
        return orderSettingMapper.updateByPrimaryKey(orderSetting);
    }
}
