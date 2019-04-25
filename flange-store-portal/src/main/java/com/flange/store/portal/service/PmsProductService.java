package com.flange.store.portal.service;

import com.flange.store.model.PmsProduct;

/**
 * @author flangely
 * @create 2019-04-25
 * <p> 商城前台获取商品信息Service
 * 10:01 AM
 */
public interface PmsProductService {

    public PmsProduct getById(String id);
}
