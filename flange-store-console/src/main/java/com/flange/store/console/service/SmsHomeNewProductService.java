package com.flange.store.console.service;

import com.flange.store.model.SmsHomeNewProduct;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author flangely
 * @create 2019-04-15
 * <p> 首页新品管理Service
 * 11:07 AM
 */
public interface SmsHomeNewProductService {
    /**
     * 添加首页推荐
     */
    @Transactional
    int create(List<SmsHomeNewProduct> homeNewProductList);

    /**
     * 修改推荐排序
     */
    int updateSort(String id, Integer sort);

    /**
     * 批量删除推荐
     */
    int delete(List<String> ids);

    /**
     * 更新推荐状态
     */
    int updateRecommendStatus(List<String> ids, Integer recommendStatus);

    /**
     * 分页查询推荐
     */
    List<SmsHomeNewProduct> list(String productName, Integer recommendStatus, Integer pageSize, Integer pageNum);
}
