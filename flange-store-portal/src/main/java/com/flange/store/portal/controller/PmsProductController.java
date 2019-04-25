package com.flange.store.portal.controller;

import com.flange.store.model.PmsProduct;
import com.flange.store.portal.domain.CommonResult;
import com.flange.store.portal.service.PmsProductService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author flangely
 * @create 2019-04-25
 * <p>
 * 10:04 AM
 */
@RestController
@Api(tags = "PmsProductController", description = "商品内容获取")
@RequestMapping("/product")
public class PmsProductController {

    @Autowired
    private PmsProductService productService;

    @ApiOperation("获取单个商品信息")
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public Object getOne(@PathVariable(value = "id") String id){
        return new CommonResult().success(productService.getById(id));
    }

}
