package com.flange.store.portal.dao;

import com.flange.store.model.PmsBrand;
import com.flange.store.model.PmsProduct;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author flangely
 * @create 2019-04-19
 * <p> 首页内容自定义管理Dao
 * 3:57 PM
 */
public interface HomeDao {

    /**
     * 获取推荐出版社
     */
    List<PmsBrand> getRecommendBrandList(@Param("offset") Integer offset, @Param("limit") Integer limit);

    /**
     * 获取新品推荐
     */
    List<PmsProduct> getNewProductList(@Param("offset") Integer offset, @Param("limit") Integer limit);
    /**
     * 获取人气推荐
     */
    List<PmsProduct> getHotProductList(@Param("offset") Integer offset,@Param("limit") Integer limit);

}
