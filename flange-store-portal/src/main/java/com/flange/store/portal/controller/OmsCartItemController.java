package com.flange.store.portal.controller;

import com.fasterxml.jackson.databind.util.JSONPObject;
import com.flange.store.model.OmsCartItem;
import com.flange.store.model.PmsProduct;
import com.flange.store.model.UmsMember;
import com.flange.store.portal.domain.CartProduct;
import com.flange.store.portal.domain.CommonResult;
import com.flange.store.portal.service.OmsCartItemService;
import com.flange.store.portal.service.PmsProductService;
import com.flange.store.portal.service.UmsMemberService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * @author flangely
 * @create 2019-04-20
 * <p> 购物车管理Controller
 * 10:17 AM
 */
@RestController
@Api(tags = "OmsCartItemController", description = "购物车管理")
@RequestMapping("/cart")
public class OmsCartItemController {

    @Autowired
    private OmsCartItemService cartItemService;

    @Autowired
    private UmsMemberService memberService;

    @Autowired
    private PmsProductService productService;

    @ApiOperation("添加商品到购物车")
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public Object add(@RequestBody Map<String, Object> map){
        String productId = (String) map.get("productId");
        int quantity = (int) map.get("quantity");
        UmsMember member = memberService.getCurrentMember();
        PmsProduct product = productService.getById(productId);
        OmsCartItem cartItem = new OmsCartItem();
        cartItem.setProductId(productId);
        cartItem.setMemberId(member.getId());
        cartItem.setQuantity(quantity);
        cartItem.setPrice(product.getPrice());
        cartItem.setProductPic(product.getPictureUrl());
        cartItem.setProductName(product.getName());
        cartItem.setProductSubTitle(product.getSubTitle());
        cartItem.setMemberNickname(member.getNickname());
        cartItem.setCreateDate(new Date());
        cartItem.setDeleteStatus(0);
        cartItem.setProductCategoryId(product.getProductCategoryId());
        cartItem.setProductSn(product.getProductSn());
        cartItem.setProductBrand(product.getBrandName());
        int count = cartItemService.add(cartItem);
        if (count > 0){
            return new CommonResult().success(count);
        }
        return new CommonResult().failed();
    }

    @ApiOperation("获取某个会员的购物车列表")
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public Object list(){
        List<OmsCartItem> cartItemList = cartItemService.list(memberService.getCurrentMember().getId());
        return new CommonResult().success(cartItemList);
    }

    @ApiOperation("修改购物车中某个商品的数量")
    @RequestMapping(value = "/update/quantity", method = RequestMethod.PUT)
    public Object updateQuantity(@RequestParam String id, @RequestParam Integer quantity){
        int count = cartItemService.updateQuantity(id, memberService.getCurrentMember().getId(), quantity);
        if (count > 0){
            return new CommonResult().success(count);
        }
        return new CommonResult().failed();
    }

    @ApiOperation("获取购物车中某个商品的规格,用于重选规格")
    @RequestMapping(value = "/getProduct/{productId}", method = RequestMethod.GET)
    public Object getCartProduct(@PathVariable String productId) {
        CartProduct cartProduct = cartItemService.getCartProduct(productId);
        return new CommonResult().success(cartProduct);
    }

    @ApiOperation("修改购物车中商品的规格")
    @RequestMapping(value = "/update/attr", method = RequestMethod.POST)
    public Object updateAttr(@RequestBody OmsCartItem cartItem) {
        int count = cartItemService.updateAttr(cartItem);
        if (count > 0) {
            return new CommonResult().success(count);
        }
        return new CommonResult().failed();
    }


    @ApiOperation("删除购物车中的某个商品")
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public Object delete(@RequestBody Map<String, Object> map) {
        List<Object> objectList = (List<Object>) map.get("ids");
        List<String> ids = objectList.stream().map(value -> value.toString()).collect(Collectors.toList());
        int count = cartItemService.delete(memberService.getCurrentMember().getId(),ids);
        if (count > 0) {
            return new CommonResult().success(count);
        }
        return new CommonResult().failed();
    }


    @ApiOperation("清空购物车")
    @RequestMapping(value = "/clear", method = RequestMethod.POST)
    public Object clear() {
        int count = cartItemService.clear(memberService.getCurrentMember().getId());
        if (count > 0) {
            return new CommonResult().success(count);
        }
        return new CommonResult().failed();
    }



}
