package com.flange.store.search.repository;

import com.flange.store.search.dto.EsProduct;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.elasticsearch.repository.ElasticsearchRepository;

/**
 * @author flangely
 * @create 2019-04-16
 * <p> 商品ES操作类
 * 3:41 PM
 */
public interface EsProductRepository extends ElasticsearchRepository<EsProduct, String> {

    /**
     * 搜索查询
     *
     * @param name              商品名称
     * @param subTitle          商品标题
     * @param keywords          商品关键字
     * @param page              分页信息
     * @return
     */
    Page<EsProduct> findByNameOrSubTitleOrKeywordsOrProductCategoryNameOrBrandName(String name, String subTitle, String keywords, String productCategoryName, String brandName, Pageable page);

}
