package com.flange.store.portal.repository;

import com.flange.store.portal.domain.MemberReadHistory;
import org.springframework.data.mongodb.repository.MongoRepository;

import java.util.List;

/**
 * @author flangely
 * @create 2019-04-19
 * <p> 商品浏览历史记录Repository
 * 9:40 PM
 */
public interface MemberReadHistoryRepository extends MongoRepository<MemberReadHistory, String> {
    List<MemberReadHistory> findByMemberIdOrderByCreateTimeDesc(String memberId);

}
