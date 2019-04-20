package com.flange.store.portal.service.impl;

import com.flange.store.portal.domain.MemberProductCollection;
import com.flange.store.portal.repository.MemberProductCollectionRepository;
import com.flange.store.portal.service.MemberCollectionService;
import org.springframework.beans.factory.annotation.Autowired;
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
}
