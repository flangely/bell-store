package com.flange.store.console.controller;

import com.flange.store.console.dto.CommonResult;
import com.flange.store.console.service.OmsOrderSettingService;
import com.flange.store.model.OmsOrderSetting;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * @author flangely
 * @create 2019-04-15
 * <p> 订单设置Controller
 * 10:22 AM
 */

@RestController
@Api(tags = "OmsOrderSettingController", description = "订单设置管理")
@RequestMapping("/orderSetting")
public class OmsOrderSettingController {
    
    @Autowired
    private OmsOrderSettingService orderSettingService;

    @ApiOperation("获取指定订单设置")
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public Object getItem(@PathVariable String id) {
        OmsOrderSetting orderSetting = orderSettingService.getItem(id);
        return new CommonResult().success(orderSetting);
    }

    @ApiOperation("修改指定订单设置")
    @RequestMapping(value = "/update/{id}", method = RequestMethod.POST)
    public Object update(@PathVariable String id, @RequestBody OmsOrderSetting orderSetting) {
        int count = orderSettingService.update(id,orderSetting);
        if(count>0){
            return new CommonResult().success(count);
        }
        return new CommonResult().failed();
    }
    
    
    
}
