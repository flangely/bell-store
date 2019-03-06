package com.flange.store.console.service;

import com.flange.store.console.dto.PmsProductCategoryParam;
import com.flange.store.console.dto.PmsProductCategoryWithChildrenItem;
import com.flange.store.model.PmsProductCategory;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author flangely
 * @create 2019-03-06
 * <p>
 * 10:17 PM
 */
public interface PmsProductCategoryService {
    @Transactional
    int create(PmsProductCategoryParam pmsProductCategoryParam);

    @Transactional
    int update(String id, PmsProductCategoryParam pmsProductCategoryParam);

    List<PmsProductCategory> getList(String parentId, Integer pageSize, Integer pageNum);

    int delete(String id);

    PmsProductCategory getItem(String id);

    int updateNavStatus(List<String> ids, Integer navStatus);

    int updateShowStatus(List<String> ids, Integer showStatus);

    List<PmsProductCategoryWithChildrenItem> listWithChildren();
}
