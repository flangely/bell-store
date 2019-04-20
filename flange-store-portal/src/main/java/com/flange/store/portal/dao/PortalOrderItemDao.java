package com.flange.store.portal.dao;

import com.flange.store.model.OmsOrderItem;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author flangely
 * @create 2019-04-19
 * <p>订单商品信息自定义Dao
 * 8:59 PM
 */
public interface PortalOrderItemDao {
    int insertList(@Param("list") List<OmsOrderItem> list);
}
