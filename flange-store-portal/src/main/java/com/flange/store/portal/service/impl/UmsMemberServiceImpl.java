package com.flange.store.portal.service.impl;

import com.flange.store.mapper.UmsMemberLoginLogMapper;
import com.flange.store.mapper.UmsMemberMapper;
import com.flange.store.model.UmsMember;
import com.flange.store.model.UmsMemberExample;
import com.flange.store.model.UmsMemberLoginLog;
import com.flange.store.model.UmsMemberLoginLogExample;
import com.flange.store.portal.domain.CommonResult;
import com.flange.store.portal.domain.MemberDetails;
import com.flange.store.portal.service.RedisService;
import com.flange.store.portal.service.UmsMemberService;
import com.flange.store.portal.util.JwtTokenUtil;
import com.flange.store.util.IdUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
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

    private static final Logger LOGGER = LoggerFactory.getLogger(UmsMemberServiceImpl.class);

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

    @Autowired
    private UserDetailsService userDetailsService;

    @Autowired
    private AuthenticationManager authenticationManager;

    @Autowired
    private JwtTokenUtil jwtTokenUtil;

    @Autowired
    private UmsMemberLoginLogMapper memberLoginLogMapper;



    @Override
    public String login(String username, String password) {
        String token = null;
        UsernamePasswordAuthenticationToken authenticationToken = new UsernamePasswordAuthenticationToken(username, password);
        try {
            Authentication authentication = authenticationManager.authenticate(authenticationToken);
            SecurityContextHolder.getContext().setAuthentication(authentication);
            UserDetails userDetails = userDetailsService.loadUserByUsername(username);
            token = jwtTokenUtil.generateToken(userDetails);
            insertLoginLog(username);

        }catch (Exception e){
            LOGGER.warn("登录异常:{}", e.getMessage());
        }
        return token;
    }

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
    public CommonResult register(String username, String password, String telephone) {
        //验证验证码
//        if(!verifyAuthCode(authCode,telephone)){
//            return new CommonResult().failed("验证码错误");
//        }
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
        umsMember.setUserPassword(passwordEncoder.encode(password));
        umsMember.setCreateTime(new Date());
        umsMember.setStatus(1);
        umsMember.setNickname(username);
        memberMapper.insertSelective(umsMember);
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
    public CommonResult updatePassword(String oldPwd, String newPwd) {
        UmsMember member = getCurrentMember();
        boolean correct = passwordEncoder.matches(oldPwd, member.getUserPassword());
        if (correct){//密码验证通过
            member.setUserPassword(passwordEncoder.encode(newPwd));
            int count = memberMapper.updateByPrimaryKeySelective(member);
            return new CommonResult().success(count);
        }else {
            return new CommonResult().failed("密码错误");
        }
    }

    @Override
    public UmsMember getCurrentMember() {
        SecurityContext ctx = SecurityContextHolder.getContext();
        Authentication auth = ctx.getAuthentication();
        MemberDetails memberDetails = (MemberDetails) auth.getPrincipal();
        return memberDetails.getUmsMember();
    }

    @Override
    public UmsMember updateInfo(UmsMember member) {
        UmsMember currentMember = getCurrentMember();
        member.setId(currentMember.getId());
        member.setUserPassword(null);
        memberMapper.updateByPrimaryKeySelective(member);
        return member;
    }


    //对输入的验证码进行校验
    private boolean verifyAuthCode(String authCode, String telephone){
        if(StringUtils.isEmpty(authCode)){
            return false;
        }
        String realAuthCode = redisService.get(REDIS_KEY_PREFIX_AUTH_CODE + telephone);
        return authCode.equals(realAuthCode);
    }

    /**
     * 记录会员登录日志
     * @param username
     */
    private void insertLoginLog(String username){

        UmsMember member = getByUsername(username);
        UmsMemberLoginLogExample example = new UmsMemberLoginLogExample();
        UmsMemberLoginLog loginLog = new UmsMemberLoginLog();
        loginLog.setId(IdUtil.getGeneralID());
        loginLog.setCreateTime(new Date());
        ServletRequestAttributes servletRequestAttributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        HttpServletRequest request = servletRequestAttributes.getRequest();
        loginLog.setIp(request.getRemoteHost());
        loginLog.setMemberId(member.getId());
        memberLoginLogMapper.insertSelective(loginLog);

    }


}
