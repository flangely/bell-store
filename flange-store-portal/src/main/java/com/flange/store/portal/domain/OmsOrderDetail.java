package com.flange.store.portal.domain;

import com.flange.store.model.OmsOrder;
import com.flange.store.model.OmsOrderItem;

import java.util.List;

/**
 * @author flangely
 * @create 2019-04-19
 * <p>包含订单商品信息的订单详情
 * 8:44 PM
 */
public class OmsOrderDetail extends OmsOrder {
    private List<OmsOrderItem> orderItemList;

    public List<OmsOrderItem> getOrderItemList() {
        return orderItemList;
    }

    public void setOrderItemList(List<OmsOrderItem> orderItemList) {
        this.orderItemList = orderItemList;
    }
}
