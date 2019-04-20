package com.flange.store.portal.service;

import com.flange.store.portal.domain.MemberBrandAttention;

import java.util.List;

/**
 * @author flangely
 * @create 2019-04-19
 * <p>会员关注Service
 * 9:05 PM
 */
public interface MemberAttentionService {
    /**
     * 添加关注
     */
    int add(MemberBrandAttention memberBrandAttention);

    /**
     * 取消关注
     */
    int delete(String memberId, String brandId);

    /**
     * 获取用户关注列表
     */
    List<MemberBrandAttention> list(String memberId);
}
