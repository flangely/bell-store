package com.flange.store.console.service;

import com.flange.store.console.dto.PmsBrandParam;
import com.flange.store.model.PmsBrand;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author flangely
 * @create 2019-03-22
 * <p>出版社（商品出版社）Service
 * 10:42 AM
 */
public interface PmsBrandService {
    List<PmsBrand> listAllBrand();

    int createBrand(PmsBrandParam pmsBrandParam);
    @Transactional
    int updateBrand(String id, PmsBrandParam pmsBrandParam);

    int deleteBrand(String id);

    int deleteBrand(List<String> ids);

    List<PmsBrand> listBrand(String keyword, int pageNum, int pageSize);

    PmsBrand getBrand(String id);

    int updateShowStatus(List<String> ids, Integer showStatus);

    int updateFactoryStatus(List<String> ids, Integer factoryStatus);

    List<PmsBrand> getSome(List<String> ids);
}
