package com.flange.store.portal.dao;

import com.flange.store.portal.domain.CartProduct;
import org.apache.ibatis.annotations.Param;

/**
 * @author flangely
 * @create 2019-04-20
 * <p> 商品前台自定义商品Dao
 * 9:45 AM
 */
public interface PortalProductDao {
    CartProduct getCartProduct(@Param("id") String id);
}
