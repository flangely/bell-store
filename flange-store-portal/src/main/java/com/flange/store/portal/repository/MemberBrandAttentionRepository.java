package com.flange.store.portal.repository;

import com.flange.store.portal.domain.MemberBrandAttention;
import org.springframework.data.mongodb.repository.MongoRepository;

import java.util.List;

/**
 * @author flangely
 * @create 2019-04-19
 * <p>会员关注Repository
 * 9:07 PM
 */
public interface MemberBrandAttentionRepository extends MongoRepository<MemberBrandAttention, String> {

    MemberBrandAttention findByMemberIdAndBrandId(String memberId, String brandId);
    int deleteByMemberIdAndBrandId(String memberId,String brandId);
    List<MemberBrandAttention> findByMemberId(String memberId);
    
}
