package com.flange.store.portal.domain;

import com.flange.store.model.CmsSubject;
import com.flange.store.model.PmsBrand;
import com.flange.store.model.PmsProduct;
import com.flange.store.model.SmsHomeAdvertise;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

/**
 * @author flangely
 * @create 2019-04-19
 * <p>
 * 4:20 PM
 */
@Getter
@Setter
public class HomeContentResult {
    //轮播广告
    private List<SmsHomeAdvertise> advertiseList;
    //推荐出版社
    private List<PmsBrand> brandList;
    //新品推荐
    private List<PmsProduct> newProductList;
    //人气推荐
    private List<PmsProduct> hotProductList;
}
