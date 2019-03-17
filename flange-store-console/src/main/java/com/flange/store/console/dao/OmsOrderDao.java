package com.flange.store.console.dao;

import com.flange.store.console.dto.OmsOrderDeliveryParam;
import com.flange.store.console.dto.OmsOrderDetail;
import com.flange.store.console.dto.OmsOrderQueryParam;
import com.flange.store.model.OmsOrder;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author flangely
 * @create 2019-03-17
 * <p>订单自定义查询DAO
 * 9:54 AM
 */
public interface OmsOrderDao {
    /**
     * 条件查询订单
     */
    List<OmsOrder> getList(@Param("queryParam") OmsOrderQueryParam queryParam);

    /**
     * 批量发货
     */
    int delivery(@Param("list") List<OmsOrderDeliveryParam> deliveryParamList);

    /**
     * 获取订单详情
     */
    OmsOrderDetail getDetail(@Param("id") String id);
}
