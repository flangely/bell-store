package com.flange.store.console.dao;

import com.flange.store.console.dto.PmsProductCategoryWithChildrenItem;

import java.util.List;

/**
 * @author flangely
 * @create 2019-03-06
 * <p>
 * 11:49 PM
 */
public interface PmsProductCategoryDao {
    List<PmsProductCategoryWithChildrenItem> listWithChildren();
}
