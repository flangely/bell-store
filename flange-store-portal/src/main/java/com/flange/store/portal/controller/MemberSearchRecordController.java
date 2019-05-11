package com.flange.store.portal.controller;

import com.flange.store.portal.domain.CommonResult;
import com.flange.store.portal.domain.MemberSearchRecord;
import com.flange.store.portal.service.MemberSearchRecordService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import java.util.List;

/**
 * @author flangely
 * @create 2019-05-07
 * <p> 用户搜索记录Controller
 * 9:55 AM
 */
@RestController
@Api(tags = "MemberSearchRecordController", description = "会员搜索记录管理")
@RequestMapping("/search/record")
public class MemberSearchRecordController {

    @Autowired
    private MemberSearchRecordService searchRecordService;


    @ApiOperation("查找用户搜索记录")
    @RequestMapping(value = "/findByMemberId", method = RequestMethod.GET)
    public Object findByMemberId(@RequestParam String memberId){
        List<MemberSearchRecord> records = searchRecordService.findByMemberId(memberId);
        return new CommonResult().success(records);
    }

    @ApiOperation("删除用户所有搜索记录")
    @RequestMapping(value = "/deleteByMemberId", method = RequestMethod.DELETE)
    public Object deleteByMemberId(@RequestParam String memberId){
        int count = searchRecordService.deleteByMemberId(memberId);
        return new CommonResult().success(count);
    }


    @ApiOperation("删除单个搜索记录")
    @RequestMapping(value = "/deleteById", method = RequestMethod.DELETE)
    public Object deleteById(@RequestParam String id){
        int count = searchRecordService.deleteById(id);
        return new CommonResult().success(count);
    }


    @ApiOperation("添加用户搜索记录")
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public Object findByMemberId(@RequestBody MemberSearchRecord record){
        int count = searchRecordService.save(record);
        return new CommonResult().success(count);
    }


}
