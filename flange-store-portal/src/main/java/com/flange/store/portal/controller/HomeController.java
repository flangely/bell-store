package com.flange.store.portal.controller;

import com.flange.store.model.PmsProduct;
import com.flange.store.model.PmsProductCategory;
import com.flange.store.portal.domain.CommonResult;
import com.flange.store.portal.domain.HomeContentResult;
import com.flange.store.portal.service.HomeService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @author flangely
 * @create 2019-04-19
 * <p> 首页内容管理Controller
 * 4:31 PM
 */
@Controller
@Api(tags = "HomeController", description = "首页内容管理")
@RequestMapping("/home")
public class HomeController {
    @Autowired
    private HomeService homeService;

    @ApiOperation("首页内容页信息展示")
    @RequestMapping(value = "/content", method = RequestMethod.GET)
    @ResponseBody
    public Object content() {
        Object contentResult = homeService.content();
        return new CommonResult().success(contentResult);
    }

    @ApiOperation("分页获取推荐商品")
    @RequestMapping(value = "/recommendProductList", method = RequestMethod.GET)
    @ResponseBody
    public Object recommendProductList(@RequestParam(value = "pageSize", defaultValue = "4") Integer pageSize,
                                       @RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum) {
        List<PmsProduct> productList = homeService.recommendProductList(pageSize, pageNum);
        return new CommonResult().success(productList);
    }

    @ApiOperation("获取首页商品分类")
    @RequestMapping(value = "/productCateList/{parentId}", method = RequestMethod.GET)
    @ResponseBody
    public Object getProductCateList(@PathVariable String parentId) {
        List<PmsProductCategory> productCategoryList = homeService.getProductCateList(parentId);
        return new CommonResult().success(productCategoryList);
    }

}
