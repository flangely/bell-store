package com.flange.store.portal.service;

import com.flange.store.portal.domain.MemberReadHistory;

import java.util.List;

/**
 * @author flangely
 * @create 2019-04-19
 * <p> 商品浏览历史记录Service
 * 9:42 PM
 */
public interface MemberReadHistoryService {
    /**
     * 生成浏览记录
     */
    int create(MemberReadHistory memberReadHistory);

    /**
     * 批量删除浏览记录
     */
    int delete(List<String> ids);

    /**
     * 获取用户浏览历史记录
     */
    List<MemberReadHistory> list(String memberId);
}
