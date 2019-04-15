package com.flange.store.console.service;

import com.flange.store.model.SmsHomeRecommendProduct;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author flangely
 * @create 2019-04-15
 * <p> 首页人气推荐管理Service
 * 11:13 AM
 */
public interface SmsHomeRecommendProductService {

    /**
     * 添加首页推荐
     */
    @Transactional
    int create(List<SmsHomeRecommendProduct> homeRecommendProductList);

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
    List<SmsHomeRecommendProduct> list(String productName, Integer recommendStatus, Integer pageSize, Integer pageNum);
}
