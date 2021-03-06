package com.flange.store.console.controller;

import com.flange.store.console.component.ProductChangeSender;
import com.flange.store.console.dto.CommonResult;
import com.flange.store.console.dto.PmsProductParam;
import com.flange.store.console.dto.PmsProductQueryParam;
import com.flange.store.console.dto.PmsProductResult;
import com.flange.store.console.service.PmsProductService;
import com.flange.store.model.PmsProduct;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @author flangely
 * @create 2019-03-29
 * <p>
 * 12:09 AM
 */
@Controller
@Api(tags = "PmsProductController", description = "商品管理")
@RequestMapping("/product")
public class PmsProductController {


    @Autowired
    private PmsProductService productService;

    @Autowired
    private ProductChangeSender productChangeSender;


    @ApiOperation("创建商品")
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    @ResponseBody
    @PreAuthorize("hasAuthority('pms:product:create')")
    public Object creat(@RequestBody PmsProductParam param, BindingResult bindingResult){
        int count = productService.create(param);
        if (count > 0){
            return new CommonResult().success(count);
        }else {
            return new CommonResult().failed();
        }
    }

    @ApiOperation("查询商品")
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    @ResponseBody
    @PreAuthorize("hasAuthority('pms:product:read')")
    public Object list(PmsProductQueryParam  queryParam,
                       @RequestParam(value = "pageSize", defaultValue = "5") Integer pageSize,
                       @RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum){
        List<PmsProduct> productList = productService.list(queryParam, pageSize, pageNum);
        return new CommonResult().pageSuccess(productList);

    }

    @ApiOperation("根据商品名称或货号模糊查询")
    @RequestMapping(value = "/simpleList", method = RequestMethod.GET)
    @ResponseBody
    public Object getList(String  keyword) {
        List<PmsProduct> productList = productService.list(keyword);
        return new CommonResult().success(productList);
    }

    @ApiOperation("根据商品id获取商品编辑信息")
    @RequestMapping(value = "/updateInfo/{id}", method = RequestMethod.GET)
    @ResponseBody
    @PreAuthorize("hasAuthority('pms:product:read')")
    public Object getUpdateInfo(@PathVariable String id) {
        PmsProductResult productResult = productService.getUpdateInfo(id);
        return new CommonResult().success(productResult);
    }

    @ApiOperation("更新商品")
    @RequestMapping(value = "/update/{id}", method = RequestMethod.POST)
    @ResponseBody
    @PreAuthorize("hasAuthority('pms:product:update')")
    public Object update(@PathVariable String id, @RequestBody PmsProductParam productParam, BindingResult bindingResult) {
        int count = productService.update(id, productParam);
        if (count > 0) {
            return new CommonResult().success(count);
        } else {
            return new CommonResult().failed();
        }
    }

    @ApiOperation("批量修改删除状态")
    @RequestMapping(value = "/update/deleteStatus",method = RequestMethod.POST)
    @ResponseBody
    @PreAuthorize("hasAuthority('pms:product:delete')")
    public Object updateDeleteStatus(@RequestParam("ids") List<String> ids,
                                     @RequestParam("deleteStatus") Integer deleteStatus) {
        int count = productService.updateDeleteStatus(ids, deleteStatus);
        if (count > 0) {
            return new CommonResult().success(count);
        } else {
            return new CommonResult().failed();
        }
    }

    @ApiOperation("批量推荐商品")
    @RequestMapping(value = "/update/recommendStatus",method = RequestMethod.POST)
    @ResponseBody
    @PreAuthorize("hasAuthority('pms:product:update')")
    public Object updateRecommendStatus(@RequestParam("ids") List<String> ids,
                                        @RequestParam("recommendStatus") Integer recommendStatus) {
        int count = productService.updateRecommendStatus(ids, recommendStatus);
        if (count > 0) {
            return new CommonResult().success(count);
        } else {
            return new CommonResult().failed();
        }
    }

    @ApiOperation("批量设为新品")
    @RequestMapping(value = "/update/newStatus",method = RequestMethod.POST)
    @ResponseBody
    @PreAuthorize("hasAuthority('pms:product:update')")
    public Object updateNewStatus(@RequestParam("ids") List<String> ids,
                                  @RequestParam("newStatus") Integer newStatus) {
        int count = productService.updateNewStatus(ids, newStatus);
        if (count > 0) {
            return new CommonResult().success(count);
        } else {
            return new CommonResult().failed();
        }
    }

    @ApiOperation("批量上下架")
    @RequestMapping(value = "/update/publishStatus",method = RequestMethod.POST)
    @ResponseBody
    @PreAuthorize("hasAuthority('pms:product:update')")
    public Object updatePublishStatus(@RequestParam("ids") List<String> ids,
                                      @RequestParam("publishStatus") Integer publishStatus) {
        int count = productService.updatePublishStatus(ids, publishStatus);
        if (count > 0) {
            return new CommonResult().success(count);
        } else {
            return new CommonResult().failed();
        }
    }
}
