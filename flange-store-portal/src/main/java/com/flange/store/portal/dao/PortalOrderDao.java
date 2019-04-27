package com.flange.store.portal.dao;

import com.flange.store.model.OmsOrderItem;
import com.flange.store.portal.domain.OmsOrderDetail;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author flangely
 * @create 2019-04-19
 * <p> 前台订单自定义Dao
 * 8:54 PM
 */
public interface PortalOrderDao {
    /**
     * 获取订单及下单商品详情
     */
    OmsOrderDetail getDetail(@Param("orderId") String orderId);

    /**
     * 修改 pms_sku_stock表的锁定库存及真实库存
     */
    int updateSkuStock(@Param("itemList") List<OmsOrderItem> orderItemList);

    /**
     * 获取超时订单
     * @param minute 超时时间（分）
     */
    List<OmsOrderDetail> getTimeOutOrders(@Param("minute") Integer minute);

    /**
     * 批量修改订单状态
     */
    int updateOrderStatus(@Param("ids") List<String> ids,@Param("status") Integer status);

    /**
     * 解除取消订单的库存锁定
     */
    int releaseSkuStockLock(@Param("itemList") List<OmsOrderItem> orderItemList);


    /**
     * 获取会员所有订单
     * @param memberId
     * @return
     */
    List<OmsOrderDetail> getMemberOrderList(@Param("memberId") String memberId);

}
