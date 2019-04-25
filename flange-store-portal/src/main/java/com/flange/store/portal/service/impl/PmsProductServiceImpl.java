package com.flange.store.portal.service.impl;

import com.flange.store.mapper.PmsProductMapper;
import com.flange.store.model.PmsProduct;
import com.flange.store.portal.service.PmsProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author flangely
 * @create 2019-04-25
 * <p>
 * 10:02 AM
 */
@Service
public class PmsProductServiceImpl implements PmsProductService {

    @Autowired
    private PmsProductMapper productMapper;


    @Override
    public PmsProduct getById(String id) {
        return  productMapper.selectByPrimaryKey(id);
    }

}
