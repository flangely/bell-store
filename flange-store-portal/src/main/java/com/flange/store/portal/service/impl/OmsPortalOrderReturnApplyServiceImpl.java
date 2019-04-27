package com.flange.store.portal.service.impl;

import com.flange.store.mapper.OmsOrderMapper;
import com.flange.store.mapper.OmsOrderReturnApplyMapper;
import com.flange.store.model.OmsOrder;
import com.flange.store.model.OmsOrderReturnApply;
import com.flange.store.model.UmsMember;
import com.flange.store.portal.domain.OmsOrderReturnApplyParam;
import com.flange.store.portal.service.OmsPortalOrderReturnApplyService;
import com.flange.store.portal.service.UmsMemberService;
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

    @Autowired
    private UmsMemberService memberService;

    @Autowired
    private OmsOrderMapper orderMapper;

    @Override
    public int create(OmsOrderReturnApplyParam returnApply) {
        UmsMember member = memberService.getCurrentMember();
        OmsOrder order = new OmsOrder();
        order.setStatus(6);//订单退货中
        order.setId(returnApply.getOrderId());
        orderMapper.updateByPrimaryKeySelective(order);//更新订单状态为退货中
        OmsOrderReturnApply realApply = new OmsOrderReturnApply();
        realApply.setMemberUsername(member.getUserName());
        BeanUtils.copyProperties(returnApply,realApply);
        realApply.setCreateTime(new Date());
        realApply.setStatus(0);

        return returnApplyMapper.insert(realApply);
    }
}
