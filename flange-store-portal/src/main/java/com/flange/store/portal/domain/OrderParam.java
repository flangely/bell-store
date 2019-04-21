package com.flange.store.portal.domain;

import lombok.Getter;
import lombok.Setter;

import java.util.List;

/**
 * @author flangely
 * @create 2019-04-19
 * <p> 生成订单时的参数
 * 8:40 PM
 */
@Getter
@Setter
public class OrderParam {
    //收货地址id
    private String memberReceiveAddressId;
    //支付方式
    private Integer payType;

    private List<String> cartItemIds;

}
