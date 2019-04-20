package com.flange.store.portal.repository;

import com.flange.store.portal.domain.MemberProductCollection;
import org.springframework.data.mongodb.repository.MongoRepository;

import java.util.List;

/**
 * @author flangely
 * @create 2019-04-19
 * <p>商品收藏Repository
 * 9:33 PM
 */
public interface MemberProductCollectionRepository extends MongoRepository<MemberProductCollection, String> {
    MemberProductCollection findByMemberIdAndProductId(String memberId, String productId);
    int deleteByMemberIdAndProductId(String memberId,String productId);
    List<MemberProductCollection> findByMemberId(String memberId);
}
