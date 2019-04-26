package com.flange.store.portal.controller;

import com.flange.store.model.PmsProduct;
import com.flange.store.model.UmsMember;
import com.flange.store.portal.domain.CommonResult;
import com.flange.store.portal.domain.MemberProductCollection;
import com.flange.store.portal.service.MemberCollectionService;
import com.flange.store.portal.service.UmsMemberService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * @author flangely
 * @create 2019-04-19
 * <p> 会员收藏Controller
 * 9:30 PM
 */
@Controller
@Api(tags = "MemberCollectionController", description = "会员收藏管理")
@RequestMapping("/member/collection")
public class MemberCollectionController {
    @Autowired
    private MemberCollectionService memberCollectionService;

    @Autowired
    private UmsMemberService memberService;
    @ApiOperation("添加商品收藏")
    @RequestMapping(value = "/addProduct", method = RequestMethod.POST)
    @ResponseBody
    public Object addProduct(@RequestBody PmsProduct product) {
        UmsMember member = memberService.getCurrentMember();
        MemberProductCollection productCollection = new MemberProductCollection();
        productCollection.setMemberId(member.getId());
        productCollection.setMemberIcon(member.getIcon());
        productCollection.setMemberNickname(member.getNickname());
        productCollection.setProductId(product.getId());
        productCollection.setProductName(product.getName());
        productCollection.setProductPic(product.getPictureUrl());
        productCollection.setProductSubTitle(product.getSubTitle());
        productCollection.setProductPrice(product.getPrice().setScale(  2   , BigDecimal.ROUND_HALF_UP).toString());
        productCollection.setCreateTime(new Date());
        int count = memberCollectionService.addProduct(productCollection);
        if(count>0){
            return new CommonResult().success(count);
        }else{
            return new CommonResult().failed();
        }
    }

    @ApiOperation("删除收藏商品")
    @RequestMapping(value = "/deleteProduct", method = RequestMethod.POST)
    @ResponseBody
    public Object deleteProduct(@RequestParam String productId) {
        UmsMember member = memberService.getCurrentMember();
        int count = memberCollectionService.deleteProduct(member.getId(), productId);
        if(count>0){
            return new CommonResult().success(count);
        }else{
            return new CommonResult().failed();
        }
    }

    @ApiOperation("删除收藏商品")
    @RequestMapping(value = "/multiDeleteProduct", method = RequestMethod.POST)
    @ResponseBody
    public Object multiDeleteProduct(@RequestBody Map map){
        List<Object> objectList = (List<Object>)map.get("ids");
//        String memberId = map.get("memberId").toString();
        List<String> ids = objectList.stream().map(val -> val.toString()).collect(Collectors.toList());
        UmsMember member = memberService.getCurrentMember();
        int count = memberCollectionService.deleteMuliProduct(member.getId(), ids);
        return new CommonResult().success(count);

    }


    @ApiOperation("显示关注列表")
    @RequestMapping(value = "/listProduct", method = RequestMethod.GET)
    @ResponseBody
    public Object listProduct() {
        UmsMember member = memberService.getCurrentMember();
        List<MemberProductCollection> memberProductCollectionList = memberCollectionService.listProduct(member.getId());
        return new CommonResult().success(memberProductCollectionList);
    }
}
