package com.flange.store.portal.repository;

import com.flange.store.portal.domain.MemberSearchRecord;
import org.springframework.data.mongodb.repository.MongoRepository;

import java.util.List;

/**
 * @author flangely
 * @create 2019-05-07
 * <p>用户搜索记录Repository
 * 9:38 AM
 */
public interface MemberSearchRecordRepository extends MongoRepository<MemberSearchRecord, String> {

    List<MemberSearchRecord> findByMemberId(String memberId);

    int deleteByMemberId(String memberId);

    List<MemberSearchRecord> findByMemberIdAndContent(String memberId, String content);

}
