package com.flange.store.portal.service.impl;

import com.flange.store.mapper.UmsMemberMapper;
import com.flange.store.model.UmsMember;
import com.flange.store.model.UmsMemberExample;
import com.flange.store.portal.domain.CommonResult;
import com.flange.store.portal.domain.MemberDetails;
import com.flange.store.portal.service.RedisService;
import com.flange.store.portal.service.UmsMemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;

import java.util.Date;
import java.util.List;
import java.util.Random;

/**
 * @author flangely
 * @create 2019-04-19
 * <p> 会员管理Service实现
 * 4:55 PM
 */
@Service
public class UmsMemberServiceImpl implements UmsMemberService {
    @Autowired
    private UmsMemberMapper memberMapper;
    @Autowired
    private PasswordEncoder passwordEncoder;
    @Autowired
    private RedisService redisService;
    @Value("${redis.key.prefix.authCode}")
    private String REDIS_KEY_PREFIX_AUTH_CODE;
    @Value("${authCode.expire.seconds}")
    private Long AUTH_CODE_EXPIRE_SECONDS;

    @Override
    public UmsMember getByUsername(String username) {
        UmsMemberExample example = new UmsMemberExample();
        example.createCriteria().andUserNameEqualTo(username);
        List<UmsMember> memberList = memberMapper.selectByExample(example);
        if (!CollectionUtils.isEmpty(memberList)) {
            return memberList.get(0);
        }
        return null;
    }

    @Override
    public UmsMember getById(String id) {
        return memberMapper.selectByPrimaryKey(id);
    }

    @Override
    public CommonResult register(String username, String password, String telephone, String authCode) {
        //验证验证码
        if(!verifyAuthCode(authCode,telephone)){
            return new CommonResult().failed("验证码错误");
        }
        //查询是否已有该用户
        UmsMemberExample example = new UmsMemberExample();
        example.createCriteria().andUserNameEqualTo(username);
        example.or(example.createCriteria().andPhoneEqualTo(telephone));
        List<UmsMember> umsMembers = memberMapper.selectByExample(example);
        if (!CollectionUtils.isEmpty(umsMembers)) {
            return new CommonResult().failed("该用户已经存在");
        }
        //没有该用户进行添加操作
        UmsMember umsMember = new UmsMember();
        umsMember.setUserName(username);
        umsMember.setPhone(telephone);
        umsMember.setUserPassword(password);
        umsMember.setCreateTime(new Date());
        umsMember.setStatus(1);
        memberMapper.insert(umsMember);
        umsMember.setUserPassword(null);
        return new CommonResult().success("注册成功",null);
    }

    @Override
    public CommonResult generateAuthCode(String telephone) {
        StringBuilder sb = new StringBuilder();
        Random random = new Random();
        for(int i=0;i<6;i++){
            sb.append(random.nextInt(10));
        }
        //验证码绑定手机号并存储到redis
        redisService.set(REDIS_KEY_PREFIX_AUTH_CODE+telephone,sb.toString());
        redisService.expire(REDIS_KEY_PREFIX_AUTH_CODE+telephone,AUTH_CODE_EXPIRE_SECONDS);
        return new CommonResult().success("获取验证码成功",sb.toString());
    }

    @Override
    public CommonResult updatePassword(String telephone, String password, String authCode) {
        UmsMemberExample example = new UmsMemberExample();
        example.createCriteria().andPhoneEqualTo(telephone);
        List<UmsMember> memberList = memberMapper.selectByExample(example);
        if(CollectionUtils.isEmpty(memberList)){
            return new CommonResult().failed("该账号不存在");
        }
        //验证验证码
        if(!verifyAuthCode(authCode,telephone)){
            return new CommonResult().failed("验证码错误");
        }
        UmsMember umsMember = memberList.get(0);
        umsMember.setUserPassword(password);
        memberMapper.updateByPrimaryKeySelective(umsMember);
        return new CommonResult().success("密码修改成功",null);
    }

    @Override
    public UmsMember getCurrentMember() {
        SecurityContext ctx = SecurityContextHolder.getContext();
        Authentication auth = ctx.getAuthentication();
        MemberDetails memberDetails = (MemberDetails) auth.getPrincipal();
        return memberDetails.getUmsMember();
    }
    

    //对输入的验证码进行校验
    private boolean verifyAuthCode(String authCode, String telephone){
        if(StringUtils.isEmpty(authCode)){
            return false;
        }
        String realAuthCode = redisService.get(REDIS_KEY_PREFIX_AUTH_CODE + telephone);
        return authCode.equals(realAuthCode);
    }

}
