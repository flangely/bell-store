package com.flange.store.console.service;

import com.flange.store.console.dto.OmsOrderReturnApplyResult;
import com.flange.store.console.dto.OmsReturnApplyQueryParam;
import com.flange.store.console.dto.OmsUpdateStatusParam;
import com.flange.store.model.OmsOrderReturnApply;

import java.util.List;

/**
 * @author flangely
 * @create 2019-03-17
 * <p>
 * 9:40 AM
 */
public interface OmsOrderReturnApplyService {
    /**
     * 分页查询申请
     */
    List<OmsOrderReturnApply> list(OmsReturnApplyQueryParam queryParam, Integer pageSize, Integer pageNum);

    /**
     * 批量删除申请
     */
    int delete(List<String> ids);

    /**
     * 修改申请状态
     */
    int updateStatus(String id, OmsUpdateStatusParam statusParam);

    /**
     * 获取指定申请详情
     */
    OmsOrderReturnApplyResult getItem(String id);
}
