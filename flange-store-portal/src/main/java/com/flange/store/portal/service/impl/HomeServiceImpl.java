package com.flange.store.portal.service.impl;

import com.flange.store.mapper.CmsSubjectMapper;
import com.flange.store.mapper.PmsProductCategoryMapper;
import com.flange.store.mapper.PmsProductMapper;
import com.flange.store.mapper.SmsHomeAdvertiseMapper;
import com.flange.store.model.*;
import com.flange.store.portal.dao.HomeDao;
import com.flange.store.portal.domain.HomeContentResult;
import com.flange.store.portal.service.HomeService;
import com.flange.store.portal.service.RedisService;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author flangely
 * @create 2019-04-19
 * <p>
 * 4:22 PM
 */
@Service
public class HomeServiceImpl implements HomeService {
    @Autowired
    private SmsHomeAdvertiseMapper advertiseMapper;
    @Autowired
    private HomeDao homeDao;
    @Autowired
    private PmsProductMapper productMapper;
    @Autowired
    private PmsProductCategoryMapper productCategoryMapper;
    @Autowired
    private CmsSubjectMapper subjectMapper;

    @Autowired
    private RedisService redisService;

    @Override
    public Object content() {
        HomeContentResult result = new HomeContentResult();
        Object homeCache = redisService.getObj("home", "content");
        if (homeCache == null){
            //获取首页广告
            result.setAdvertiseList(getHomeAdvertiseList());
            //获取推荐出版社
            result.setBrandList(homeDao.getRecommendBrandList(0,20));
            //获取新品推荐
            result.setNewProductList(homeDao.getNewProductList(0,20));
            //获取人气推荐
            result.setHotProductList(homeDao.getHotProductList(0,20));
            redisService.setObj("home", "content", result);
        }else {
            return homeCache;
        }
        return result;
    }

    @Override
    public List<PmsProduct> recommendProductList(Integer pageSize, Integer pageNum) {
        // TODO: 2019/1/29 暂时默认推荐所有商品
        PageHelper.startPage(pageNum,pageSize);
        PmsProductExample example = new PmsProductExample();
        example.createCriteria()
                .andDeleteStatusEqualTo(0)
                .andPublishStatusEqualTo(1);
        return productMapper.selectByExample(example);
    }

    @Override
    public List<PmsProductCategory> getProductCateList(String parentId) {
        PmsProductCategoryExample example = new PmsProductCategoryExample();
        example.createCriteria()
                .andShowStatusEqualTo(1)
                .andParentIdEqualTo(parentId);
        example.setOrderByClause("sort desc");
        return productCategoryMapper.selectByExample(example);
    }

    private List<SmsHomeAdvertise> getHomeAdvertiseList() {
        SmsHomeAdvertiseExample example = new SmsHomeAdvertiseExample();
        example.createCriteria().andTypeEqualTo(0).andStatusEqualTo(1);
        example.setOrderByClause("sort desc");
        return advertiseMapper.selectByExample(example);
    }
    
}
