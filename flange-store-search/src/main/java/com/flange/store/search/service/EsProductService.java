package com.flange.store.search.service;

import com.flange.store.search.dto.EsProduct;
import com.flange.store.search.dto.EsProductRelatedInfo;
import org.springframework.data.domain.Page;

import java.util.List;

/**
 * @author flangely
 * @create 2019-04-16
 * <p> ES商品操作Service
 * 3:43 PM
 */
public interface EsProductService {

    /**
     * 从数据库中导入所有商品到ES
     */
    int importAll();

    /**
     * 根据id删除商品
     */
    void delete(String id);

    /**
     * 根据id创建商品
     */
    EsProduct create(String id);

    /**
     * 批量删除商品
     */
    void delete(List<String> ids);

    /**
     * 根据关键字搜索名称、作者、出版社和分类
     */
    Page<EsProduct> search(String keyword, Integer pageNum, Integer pageSize);

    /**
     * 根据关键字搜索名称或者副标题复合查询
     */
    Page<EsProduct> search(String keyword, String brandId, String productCategoryId, Integer pageNum, Integer pageSize,Integer sort);

    /**
     * 根据商品id推荐相关商品
     */
    Page<EsProduct> recommend(String id, Integer pageNum, Integer pageSize);

    /**
     * 获取搜索词相关出版社、分类、属性
     */
    EsProductRelatedInfo searchRelatedInfo(String keyword);
}
