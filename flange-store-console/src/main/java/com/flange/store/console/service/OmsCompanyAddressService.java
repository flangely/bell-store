package com.flange.store.console.service;

import com.flange.store.model.OmsCompanyAddress;

import java.util.List;

/**
 * @author flangely
 * @create 2019-03-17
 * 收货地址管理service
 * <p>
 * 9:32 AM
 */
public interface OmsCompanyAddressService {
    /**
     * 获取全部收货地址
     */
    List<OmsCompanyAddress> list();
}
