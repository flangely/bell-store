package com.flange.store.console.dto;

/**
 * @author flangely
 * @create 2019-03-22
 * <p>查询单个产品进行修改时返回的结果
 * 10:23 PM
 */
public class PmsProductResult extends PmsProductParam {
    //商品所选分类的父id
    private String cateParentId;

    public String getCateParentId() {
        return cateParentId;
    }

    public void setCateParentId(String cateParentId) {
        this.cateParentId = cateParentId;
    }
}
