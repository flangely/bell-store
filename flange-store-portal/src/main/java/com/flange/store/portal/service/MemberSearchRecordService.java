package com.flange.store.portal.service;

import com.flange.store.portal.domain.MemberSearchRecord;

import java.util.List;

/**
 * @author flangely
 * @create 2019-05-07
 * <p>用户搜索记录Service
 * 9:44 AM
 */
public interface MemberSearchRecordService {

    List<MemberSearchRecord> findByMemberId(String memberId);

    int deleteByMemberId(String memberId);

    int deleteById(String id);

    int save(MemberSearchRecord record);

}
