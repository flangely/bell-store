package com.flange.store.console.service.impl;

import com.flange.store.console.service.OmsCompanyAddressService;
import com.flange.store.mapper.OmsCompanyAddressMapper;
import com.flange.store.model.OmsCompanyAddress;
import com.flange.store.model.OmsCompanyAddressExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author flangely
 * @create 2019-03-17
 * <p>
 * 9:33 AM
 */
@Service
public class OmsCompanyAddressServiceImpl implements OmsCompanyAddressService {
    @Autowired
    private OmsCompanyAddressMapper companyAddressMapper;
    @Override
    public List<OmsCompanyAddress> list() {
        return companyAddressMapper.selectByExample(new OmsCompanyAddressExample());
    }
}
