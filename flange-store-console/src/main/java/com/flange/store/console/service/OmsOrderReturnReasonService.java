package com.flange.store.console.service;

import com.flange.store.model.OmsOrderReturnReason;

import java.util.List;

/**
 * @author flangely
 * @create 2019-04-15
 * <p> 订单退货原因管理
 * 10:59 AM
 */
public interface OmsOrderReturnReasonService {

    /**
     * 添加订单原因
     */
    int create(OmsOrderReturnReason returnReason);

    /**
     * 修改退货原因
     */
    int update(String id, OmsOrderReturnReason returnReason);

    /**
     * 批量删除退货原因
     */
    int delete(List<String> ids);

    /**
     * 分页获取退货原因
     */
    List<OmsOrderReturnReason> list(Integer pageSize, Integer pageNum);

    /**
     * 批量修改退货原因状态
     */
    int updateStatus(List<String> ids, Integer status);

    /**
     * 获取单个退货原因详情信息
     */
    OmsOrderReturnReason getItem(String id);
}
