package com.flange.store.portal.service;

import com.flange.store.model.UmsMemberReceiveAddress;

import java.util.List;

/**
 * @author flangely
 * @create 2019-04-20
 * <p> 会员收货地址Service
 * 2:16 PM
 */
public interface UmsMemberReceiveAddressService {
    /**
     * 添加收货地址
     */
    int add(UmsMemberReceiveAddress address);

    /**
     * 删除收货地址
     * @param id 地址表的id
     */
    int delete(String id);

    /**
     * 修改收货地址
     * @param id 地址表的id
     * @param address 修改的收货地址信息
     */
    int update(String id, UmsMemberReceiveAddress address);

    /**
     * 返回当前用户的收货地址
     */
    List<UmsMemberReceiveAddress> list();

    /**
     * 获取地址详情
     * @param id 地址id
     */
    UmsMemberReceiveAddress getItem(String id);
}

