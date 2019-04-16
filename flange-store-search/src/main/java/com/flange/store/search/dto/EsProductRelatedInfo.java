package com.flange.store.search.dto;

import java.util.List;

/**
 * @author flangely
 * @create 2019-04-16
 * <p>
 * 3:45 PM
 */
public class EsProductRelatedInfo {
    private List<String> brandNames;
    private List<String> productCategoryNames;
//    private List<ProductAttr>   productAttrs;

    public List<String> getBrandNames() {
        return brandNames;
    }

    public void setBrandNames(List<String> brandNames) {
        this.brandNames = brandNames;
    }

    public List<String> getProductCategoryNames() {
        return productCategoryNames;
    }

    public void setProductCategoryNames(List<String> productCategoryNames) {
        this.productCategoryNames = productCategoryNames;
    }

//    public List<ProductAttr> getProductAttrs() {
//        return productAttrs;
//    }
//
//    public void setProductAttrs(List<ProductAttr> productAttrs) {
//        this.productAttrs = productAttrs;
//    }
//
//    public static class ProductAttr{
//        private Long attrId;
//        private String attrName;
//        private List<String> attrValues;
//
//        public Long getAttrId() {
//            return attrId;
//        }
//
//        public void setAttrId(Long attrId) {
//            this.attrId = attrId;
//        }
//
//        public List<String> getAttrValues() {
//            return attrValues;
//        }
//
//        public void setAttrValues(List<String> attrValues) {
//            this.attrValues = attrValues;
//        }
//
//        public String getAttrName() {
//            return attrName;
//        }
//
//        public void setAttrName(String attrName) {
//            this.attrName = attrName;
//        }
//    }
}
