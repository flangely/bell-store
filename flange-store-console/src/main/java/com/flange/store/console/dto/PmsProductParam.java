package com.flange.store.console.dto;

/**
 * @author flangely
 * @create 2019-03-22
 * <p>创建和修改商品时使用的参数
 * 10:19 PM
 */

import com.flange.store.model.CmsSubjectProductRelation;
import com.flange.store.model.PmsProduct;
import com.flange.store.model.PmsProductAttributeValue;
import com.flange.store.model.PmsSkuStock;
import io.swagger.annotations.ApiModelProperty;

import java.util.List;

public class PmsProductParam extends PmsProduct {
    @ApiModelProperty("商品的sku库存信息")
    private List<PmsSkuStock> skuStockList;


    public List<PmsSkuStock> getSkuStockList() {
        return skuStockList;
    }

    public void setSkuStockList(List<PmsSkuStock> skuStockList) {
        this.skuStockList = skuStockList;
    }
}
