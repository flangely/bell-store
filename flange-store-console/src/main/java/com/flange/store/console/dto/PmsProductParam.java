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
    @ApiModelProperty("商品参数及自定义规格属性")
    private List<PmsProductAttributeValue> productAttributeValueList;
    @ApiModelProperty("专题和商品关系")
    private List<CmsSubjectProductRelation> subjectProductRelationList;


    public List<PmsSkuStock> getSkuStockList() {
        return skuStockList;
    }

    public void setSkuStockList(List<PmsSkuStock> skuStockList) {
        this.skuStockList = skuStockList;
    }

    public List<PmsProductAttributeValue> getProductAttributeValueList() {
        return productAttributeValueList;
    }

    public void setProductAttributeValueList(List<PmsProductAttributeValue> productAttributeValueList) {
        this.productAttributeValueList = productAttributeValueList;
    }

    public List<CmsSubjectProductRelation> getSubjectProductRelationList() {
        return subjectProductRelationList;
    }

    public void setSubjectProductRelationList(List<CmsSubjectProductRelation> subjectProductRelationList) {
        this.subjectProductRelationList = subjectProductRelationList;
    }
}
