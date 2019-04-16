package com.flange.store.search.dao;

import com.flange.store.search.dto.EsProduct;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author flangely
 * @create 2019-04-16
 * <p> ES商品搜索Dao
 * 3:48 PM
 */
public interface EsProductDao {

    List<EsProduct> getAllEsProductList(@Param("id") String id);
}
