package com.flange.store.portal.service;

import com.flange.store.portal.domain.OmsOrderReturnApplyParam;

/**
 * @author flangely
 * @create 2019-04-21
 * <p> 订单退货管理Service
 * 10:44 AM
 */
public interface OmsPortalOrderReturnApplyService {
    /**
     * 提交申请
     */
    int create(OmsOrderReturnApplyParam returnApply);
}
