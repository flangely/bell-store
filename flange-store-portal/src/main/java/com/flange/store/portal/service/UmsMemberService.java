package com.flange.store.portal.service;

import com.flange.store.model.UmsMember;
import com.flange.store.portal.domain.CommonResult;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author flangely
 * @create 2019-04-19
 * <p> 会员管理Service
 * 4:43 PM
 */
public interface UmsMemberService {
    
    /**
     * 根据用户名获取会员
     */
    UmsMember getByUsername(String username);

    /**
     * 根据会员编号获取会员
     */
    UmsMember getById(String id);

    /**
     * 用户注册
     */
    @Transactional
    CommonResult register(String username, String password, String telephone, String authCode);

    /**
     * 生成验证码
     */
    CommonResult generateAuthCode(String telephone);

    /**
     * 修改密码
     */
    @Transactional
    CommonResult updatePassword(String telephone, String password, String authCode);

    /**
     * 获取当前登录会员
     */
    UmsMember getCurrentMember();
    
    
}