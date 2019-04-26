package com.flange.store.portal.service.impl;

import com.flange.store.portal.domain.MemberProductCollection;
import com.flange.store.portal.repository.MemberProductCollectionRepository;
import com.flange.store.portal.service.MemberCollectionService;
import com.mongodb.client.result.DeleteResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author flangely
 * @create 2019-04-19
 * <p> 商品收藏Service
 * 9:34 PM
 */
@Service
public class MemberCollectionServiceImpl implements MemberCollectionService {
    @Autowired
    private MemberProductCollectionRepository productCollectionRepository;

    @Autowired
    private MongoTemplate mongoTemplate;

    @Override
    public int addProduct(MemberProductCollection productCollection) {
        int count = 0;
        MemberProductCollection findCollection = productCollectionRepository.findByMemberIdAndProductId(productCollection.getMemberId(), productCollection.getProductId());
        if (findCollection == null) {
            productCollectionRepository.save(productCollection);
            count = 1;
        }
        return count;
    }

    @Override
    public int deleteProduct(String memberId, String productId) {
        return productCollectionRepository.deleteByMemberIdAndProductId(memberId, productId);
    }

    @Override
    public List<MemberProductCollection> listProduct(String memberId) {
        return productCollectionRepository.findByMemberId(memberId);
    }

    @Override
    public int deleteMuliProduct(String memberId, List<String> productIds) {
        Query query = new Query(Criteria.where("memberId").is(memberId).and("productId").in(productIds));
        int count = (int)mongoTemplate.remove(query, MemberProductCollection.class).getDeletedCount();
        return count;

    }
}
