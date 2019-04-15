package com.flange.store.console.service.impl;

import com.flange.store.console.dto.PmsProductParam;
import com.flange.store.console.dto.PmsProductQueryParam;
import com.flange.store.console.dto.PmsProductResult;
import com.flange.store.console.service.PmsProductCategoryService;
import com.flange.store.console.service.PmsProductService;
import com.flange.store.mapper.PmsProductMapper;
import com.flange.store.model.PmsProduct;
import com.flange.store.model.PmsProductExample;
import com.flange.store.util.IdUtil;
import com.flange.store.util.SFTPUtil;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.ArrayList;
import java.util.List;

/**
 * @author flangely
 * @create 2019-03-22
 * <p>
 * 10:25 PM
 */
@Service
public class PmsProductServiceImpl implements PmsProductService {

    @Autowired
    private PmsProductMapper productMapper;

    @Autowired
    private PmsProductCategoryService productCategoryService;


    @Override
    public int create(PmsProductParam productParam) {
        int count;
        PmsProduct product = productParam;
        product.setId(IdUtil.getGeneralID());
//        String pic = productParam.getAlbumPics().split(",")[0];
//        product.setPictureUrl(pic);
        productMapper.insertSelective(product);
        count = 1;
        return count;
    }

    @Override
    public PmsProductResult getUpdateInfo(String id) {
        PmsProduct product = productMapper.selectByPrimaryKey(id);
        PmsProductResult result = new PmsProductResult();
        BeanUtils.copyProperties(product, result);
        result.setCateParentId(productCategoryService.getItem(result.getProductCategoryId()).getParentId());
        return result;
    }

    @Override
    public int update(String id, PmsProductParam productParam) {
        int count;
        PmsProduct product = productParam;
        product.setId(id);
//        String pic = productParam.getAlbumPics().split(",")[0];
//        product.setPictureUrl(pic);
        productMapper.updateByPrimaryKeySelective(product);
        count = 1;
        return count;
    }

    @Override
    public List<PmsProduct> list(PmsProductQueryParam productQueryParam, Integer pageSize, Integer pageNum) {
        PageHelper.startPage(pageNum, pageSize);
        PmsProductExample productExample = new PmsProductExample();
        PmsProductExample.Criteria criteria = productExample.createCriteria();
        criteria.andDeleteStatusEqualTo(0);
        if (productQueryParam.getPublishStatus() != null) {
            criteria.andPublishStatusEqualTo(productQueryParam.getPublishStatus());
        }
        if (productQueryParam.getVerifyStatus() != null) {
            criteria.andVerifyStatusEqualTo(productQueryParam.getVerifyStatus());
        }
        if (!StringUtils.isEmpty(productQueryParam.getKeyword())) {
            criteria.andNameLike("%" + productQueryParam.getKeyword() + "%");
        }
        if (!StringUtils.isEmpty(productQueryParam.getProductSn())) {
            criteria.andProductSnEqualTo(productQueryParam.getProductSn());
        }
        if (productQueryParam.getBrandId() != null) {
            criteria.andBrandIdEqualTo(productQueryParam.getBrandId());
        }
        if (productQueryParam.getProductCategoryId() != null) {
            criteria.andProductCategoryIdEqualTo(productQueryParam.getProductCategoryId());
        }
        return productMapper.selectByExample(productExample);
    }

    @Override
    public int updateVerifyStatus(List<String> ids, Integer verifyStatus, String detail) {
        return 0;
    }

    @Override
    public int updatePublishStatus(List<String> ids, Integer publishStatus) {
        PmsProduct record = new PmsProduct();
        record.setPublishStatus(publishStatus);
        PmsProductExample example = new PmsProductExample();
        example.createCriteria().andIdIn(ids);
        return productMapper.updateByExampleSelective(record, example);
    }

    @Override
    public int updateRecommendStatus(List<String> ids, Integer recommendStatus) {
        PmsProduct record = new PmsProduct();
        record.setRecommandStatus(recommendStatus);
        PmsProductExample example = new PmsProductExample();
        example.createCriteria().andIdIn(ids);
        return productMapper.updateByExampleSelective(record, example);
    }

    @Override
    public int updateNewStatus(List<String> ids, Integer newStatus) {
        PmsProduct record = new PmsProduct();
        record.setNewStatus(newStatus);
        PmsProductExample example = new PmsProductExample();
        example.createCriteria().andIdIn(ids);
        return productMapper.updateByExampleSelective(record, example);
    }

    @Override
    public int updateDeleteStatus(List<String> ids, Integer deleteStatus) {
        PmsProduct product = new PmsProduct();
        product.setDeleteStatus(deleteStatus);
        PmsProductExample example = new PmsProductExample();
        example.createCriteria().andIdIn(ids);
        return productMapper.updateByExampleSelective(product, example);
    }

    @Override
    public List<PmsProduct> list(String keyword) {
        return null;
    }
}
