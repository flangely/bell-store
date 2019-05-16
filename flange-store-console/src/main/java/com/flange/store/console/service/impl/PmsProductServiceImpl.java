package com.flange.store.console.service.impl;

import com.flange.store.console.component.ProductChangeSender;
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
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;

import java.lang.reflect.Method;
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

    private static final Logger LOGGER = LoggerFactory.getLogger(PmsProductServiceImpl.class);

    @Autowired
    private PmsProductMapper productMapper;

    @Autowired
    private PmsProductCategoryService productCategoryService;

    @Autowired
    private ProductChangeSender productChangeSender;


    @Override
    public int create(PmsProductParam productParam) {
        int count;
        PmsProduct product = productParam;
        product.setId(IdUtil.getGeneralID());
        product.setVerifyStatus(1);
        return productMapper.insertSelective(product);
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
        productMapper.updateByPrimaryKeySelective(product);
        productChangeSender.sendMessage(id + ",edit");
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
        String operate = "";
        String idStr = "";
        if (publishStatus == 0){
            operate = "delete";
        }else {
            operate = "add";
        }
        for (String id : ids){
            idStr += id + ",";
        }
        record.setPublishStatus(publishStatus);
        PmsProductExample example = new PmsProductExample();
        example.createCriteria().andIdIn(ids);
        int count = productMapper.updateByExampleSelective(record, example);
        productChangeSender.sendMessage(idStr + operate);
        return count;
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
        String message = "";
        for (String id : ids){
            message += id + ",";
        }
        message = message.substring(0, message.lastIndexOf(",")) + ",delete";
        productChangeSender.sendMessage(message);
        return productMapper.updateByExampleSelective(product, example);
    }

    @Override
    public List<PmsProduct> list(String keyword) {
        return null;
    }


    /**
     * 建立和插入关系表操作
     *
     * @param dao       可以操作的dao
     * @param dataList  要插入的数据
     * @param productId 建立关系的id
     */
    private void relateAndInsertList(Object dao, List dataList, String productId) {
        try {
            if (CollectionUtils.isEmpty(dataList)) return;
            for (Object item : dataList) {
                Method setId = item.getClass().getMethod("setId", String.class);
                setId.invoke(item, (String) null);
                Method setProductId = item.getClass().getMethod("setProductId", String.class);
                setProductId.invoke(item, productId);
            }
            Method insertList = dao.getClass().getMethod("insertList", List.class);
            insertList.invoke(dao, dataList);
        } catch (Exception e) {
            LOGGER.warn("创建产品出错:{}", e.getMessage());
            throw new RuntimeException(e.getMessage());
        }
    }

}
