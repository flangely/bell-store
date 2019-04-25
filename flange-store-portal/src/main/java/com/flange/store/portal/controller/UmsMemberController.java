package com.flange.store.portal.controller;

import com.flange.store.model.UmsMember;
import com.flange.store.portal.domain.CommonResult;
import com.flange.store.portal.domain.UmsMemberLoginParam;
import com.flange.store.portal.service.UmsMemberService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

/**
 * @author flangely
 * @create 2019-04-19
 * <p> 会员注册管理Controller
 * 5:26 PM
 */
@Controller
@Api(tags = "UmsMemberController", description = "会员登录注册管理")
@RequestMapping("/sso")
public class UmsMemberController {
    @Autowired
    private UmsMemberService memberService;

    @Value("${jwt.tokenHead}")
    private String tokenHead;

    @ApiOperation("注册")
    @RequestMapping(value = "/register", method = RequestMethod.POST)
    @ResponseBody
    public Object register(@RequestParam String username,
                           @RequestParam String password,
                           @RequestParam String telephone,
                           @RequestParam String authCode) {
        return memberService.register(username, password, telephone, authCode);
    }

    @ApiOperation("登录以后返回token")
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    @ResponseBody
    public Object login(@RequestBody UmsMemberLoginParam loginParam){
        String token = memberService.login(loginParam.getUsername(), loginParam.getPassword());
        if (token == null){
            return new CommonResult().failed("用户名或密码错误");
        }
        Map<String, String> tokenMap = new HashMap<>();
        tokenMap.put("token", token);
        tokenMap.put("tokenHead", tokenHead);
        tokenMap.put("memberId", memberService.getCurrentMember().getId());
        return new CommonResult().success(tokenMap);
    }

    @ApiOperation("获取用户信息")
    @RequestMapping(value = "/info", method = RequestMethod.GET)
    @ResponseBody
    public Object getMemberInfo(){
        UmsMember member = memberService.getCurrentMember();
        if (member != null){
            member.setUserPassword(null);
            return new CommonResult().success(member);
        }
        return new CommonResult().failed("请先登录");
    }


    @ApiOperation(value = "登出功能")
    @RequestMapping(value = "/logout", method = RequestMethod.POST)
    @ResponseBody
    public Object logout() {
        return new CommonResult().success(null);
    }

    @ApiOperation("获取验证码")
    @RequestMapping(value = "/getAuthCode", method = RequestMethod.GET)
    @ResponseBody
    public Object getAuthCode(@RequestParam String telephone) {
        return memberService.generateAuthCode(telephone);
    }

    @ApiOperation("修改密码")
    @RequestMapping(value = "/updatePassword", method = RequestMethod.POST)
    @ResponseBody
    public Object updatePassword(@RequestParam String telephone,
                                 @RequestParam String password,
                                 @RequestParam String authCode) {
        return memberService.updatePassword(telephone,password,authCode);
    }

}
