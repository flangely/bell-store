package com.flange.store.portal.domain;

import com.flange.store.model.UmsMember;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.Arrays;
import java.util.Collection;

/**
 * @author flangely
 * @create 2019-04-19
 * <p> 会员详情dto
 * 4:40 PM
 */
public class MemberDetails implements UserDetails {
    private UmsMember umsMember;

    public MemberDetails(UmsMember umsMember) {
        this.umsMember = umsMember;
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        //返回当前用户的权限
        return Arrays.asList(new SimpleGrantedAuthority("TEST"));
    }

    @Override
    public String getPassword() {
        return umsMember.getUserPassword();
    }

    @Override
    public String getUsername() {
        return umsMember.getUserName();
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return umsMember.getStatus()==1;
    }

    public UmsMember getUmsMember() {
        return umsMember;
    }
}
