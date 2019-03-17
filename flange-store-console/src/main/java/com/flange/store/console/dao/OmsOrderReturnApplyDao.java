package com.flange.store.console.dao;

import com.flange.store.console.dto.OmsOrderReturnApplyResult;
import com.flange.store.console.dto.OmsReturnApplyQueryParam;
import com.flange.store.model.OmsOrderReturnApply;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author flangely
 * @create 2019-03-17
 * <p>订单退货申请自定义
 * 9:43 AM
 */
public interface OmsOrderReturnApplyDao {
    /**
     * 查询申请列表
     */
    List<OmsOrderReturnApply> getList(@Param("queryParam") OmsReturnApplyQueryParam queryParam);

    /**
     * 获取申请详情
     */
    OmsOrderReturnApplyResult getDetail(@Param("id")String id);
}
