package com.flange.store.console.dto;

import com.flange.store.model.OmsOrder;
import com.flange.store.model.OmsOrderItem;
import com.flange.store.model.OmsOrderOperateHistory;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

/**
 * 订单详情信息
 * Created by flangely on 2018/10/11.
 */
public class OmsOrderDetail extends OmsOrder {
    @Getter
    @Setter
    private List<OmsOrderItem> orderItemList;
    @Getter
    @Setter
    private List<OmsOrderOperateHistory> historyList;
}
