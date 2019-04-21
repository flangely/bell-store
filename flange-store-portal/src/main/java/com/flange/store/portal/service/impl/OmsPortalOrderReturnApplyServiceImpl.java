package com.flange.store.portal.service.impl;

import com.flange.store.mapper.OmsOrderReturnApplyMapper;
import com.flange.store.model.OmsOrderReturnApply;
import com.flange.store.portal.domain.OmsOrderReturnApplyParam;
import com.flange.store.portal.service.OmsPortalOrderReturnApplyService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;

/**
 * @author flangely
 * @create 2019-04-21
 * <p>
 * 10:45 AM
 */
@Service
public class OmsPortalOrderReturnApplyServiceImpl implements OmsPortalOrderReturnApplyService {
    @Autowired
    private OmsOrderReturnApplyMapper returnApplyMapper;
    @Override
    public int create(OmsOrderReturnApplyParam returnApply) {
        OmsOrderReturnApply realApply = new OmsOrderReturnApply();
        BeanUtils.copyProperties(returnApply,realApply);
        realApply.setCreateTime(new Date());
        realApply.setStatus(0);
        return returnApplyMapper.insert(realApply);
    }
}
