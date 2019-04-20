package com.flange.store.portal.domain;

/**
 * @author flangely
 * @create 2019-04-19
 * <p> 生成订单时的参数
 * 8:40 PM
 */
public class OrderParam {
    //收货地址id
    private String memberReceiveAddressId;
    //支付方式
    private Integer payType;

    public String getMemberReceiveAddressId() {
        return memberReceiveAddressId;
    }

    public void setMemberReceiveAddressId(String memberReceiveAddressId) {
        this.memberReceiveAddressId = memberReceiveAddressId;
    }


    public Integer getPayType() {
        return payType;
    }

    public void setPayType(Integer payType) {
        this.payType = payType;
    }

}
