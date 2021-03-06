package com.flange.store.portal.controller;

import com.flange.store.model.UmsMember;
import com.flange.store.portal.domain.CommonResult;
import com.flange.store.portal.domain.OmsOrderReturnApplyParam;
import com.flange.store.portal.service.OmsPortalOrderReturnApplyService;
import com.flange.store.portal.service.UmsMemberService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;

/**
 * @author flangely
 * @create 2019-04-21
 * <p>
 * 10:44 AM
 */
@Controller
@Api(tags = "OmsPortalOrderReturnApplyController", description = "申请退货管理")
@RequestMapping("/returnApply")
public class OmsPortalOrderReturnApplyController {
    @Autowired
    private OmsPortalOrderReturnApplyService returnApplyService;

    @Autowired
    private UmsMemberService memberService;

    @ApiOperation("申请退货")
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    @ResponseBody
    public Object create(@RequestBody Map<String, Object> apply) {
        OmsOrderReturnApplyParam returnApply = new OmsOrderReturnApplyParam();
        returnApply.setOrderSn(apply.get("orderSn").toString());
        returnApply.setOrderId(apply.get("orderId").toString());
        returnApply.setReturnName(apply.get("receiverName").toString());
        returnApply.setReturnPhone(apply.get("receiverPhone").toString());
        returnApply.setReason("不想要了");
        returnApply.setDescription("不想要了");
        int count = returnApplyService.create(returnApply);
        if (count > 0) {
            return new CommonResult().success(count);
        }
        return new CommonResult().failed();
    }
}