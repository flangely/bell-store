package com.flange.store.portal.service;

import com.flange.store.model.CmsSubject;
import com.flange.store.model.PmsProduct;
import com.flange.store.model.PmsProductCategory;
import com.flange.store.portal.domain.HomeContentResult;

import java.util.List;

/**
 * @author flangely
 * @create 2019-04-19
 * <p>
 * 4:19 PM
 */
public interface HomeService {

    /**
     * 获取首页内容
     */
    Object content();

    /**
     * 首页商品推荐
     */
    List<PmsProduct> recommendProductList(Integer pageSize, Integer pageNum);

    /**
     * 获取商品分类
     * @param parentId 0:获取一级分类；其他：获取指定二级分类
     */
    List<PmsProductCategory> getProductCateList(String parentId);

}
