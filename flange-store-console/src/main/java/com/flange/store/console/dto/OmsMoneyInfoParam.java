package com.flange.store.console.dto;

import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;

/**
 * 修改订单费用信息参数
 * Created by flangely on 2018/10/29.
 */
@Getter
@Setter
public class OmsMoneyInfoParam {
    private String orderId;
    private BigDecimal freightAmount;
    private BigDecimal discountAmount;
    private Integer status;
}
