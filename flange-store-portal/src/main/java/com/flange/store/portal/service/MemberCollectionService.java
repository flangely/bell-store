package com.flange.store.portal.service;

import com.flange.store.portal.domain.MemberProductCollection;

import java.util.List;

/**
 * @author flangely
 * @create 2019-04-19
 * <p>
 * 9:34 PM
 */
public interface MemberCollectionService {
    int addProduct(MemberProductCollection productCollection);

    int deleteProduct(String memberId, String productId);

    List<MemberProductCollection> listProduct(String memberId);
}
