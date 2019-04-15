package com.flange.store.console.service;

import com.flange.store.model.SmsHomeAdvertise;

import java.util.List;

/**
 * @author flangely
 * @create 2019-04-15
 * <p> 首页广告管理Service
 * 11:18 AM
 */
public interface SmsHomeAdvertiseService {

    /**
     * 添加广告
     */
    int create(SmsHomeAdvertise advertise);

    /**
     * 批量删除广告
     */
    int delete(List<String> ids);

    /**
     * 修改上、下线状态
     */
    int updateStatus(String id, Integer status);

    /**
     * 获取广告详情
     */
    SmsHomeAdvertise getItem(String id);

    /**
     * 更新广告
     */
    int update(String id, SmsHomeAdvertise advertise);

    /**
     * 分页查询广告
     */
    List<SmsHomeAdvertise> list(String name, Integer type, String endTime, Integer pageSize, Integer pageNum);
    
}
