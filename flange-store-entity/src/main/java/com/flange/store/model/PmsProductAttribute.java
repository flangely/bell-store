package com.flange.store.model;

import java.io.Serializable;

public class PmsProductAttribute implements Serializable {
    private String id;

    /**
     * 书籍分类id
     *
     * @mbggenerated
     */
    private String productAttributeCategoryId;

    private String name;

    /**
     * 属性选择类型：0->唯一；1->单选；2->多选
     *
     * @mbggenerated
     */
    private Integer selectType;

    /**
     * 属性录入方式：0->手工录入；1->从列表中选取
     *
     * @mbggenerated
     */
    private Integer inputType;

    /**
     * 可选值列表，以逗号隔开
     *
     * @mbggenerated
     */
    private String inputList;

    /**
     * 排序字段：最高的可以单独上传图片
     *
     * @mbggenerated
     */
    private Integer sort;

    /**
     * 检索类型；0->不需要进行检索；1->关键字检索；2->范围检索
     *
     * @mbggenerated
     */
    private Integer searchType;

    /**
     * 是否支持手动新增；0->不支持；1->支持
     *
     * @mbggenerated
     */
    private Integer handAddStatus;

    /**
     * 属性的类型；0->规格；1->参数
     *
     * @mbggenerated
     */
    private Integer type;

    private static final long serialVersionUID = 1L;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getProductAttributeCategoryId() {
        return productAttributeCategoryId;
    }

    public void setProductAttributeCategoryId(String productAttributeCategoryId) {
        this.productAttributeCategoryId = productAttributeCategoryId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getSelectType() {
        return selectType;
    }

    public void setSelectType(Integer selectType) {
        this.selectType = selectType;
    }

    public Integer getInputType() {
        return inputType;
    }

    public void setInputType(Integer inputType) {
        this.inputType = inputType;
    }

    public String getInputList() {
        return inputList;
    }

    public void setInputList(String inputList) {
        this.inputList = inputList;
    }

    public Integer getSort() {
        return sort;
    }

    public void setSort(Integer sort) {
        this.sort = sort;
    }

    public Integer getSearchType() {
        return searchType;
    }

    public void setSearchType(Integer searchType) {
        this.searchType = searchType;
    }

    public Integer getHandAddStatus() {
        return handAddStatus;
    }

    public void setHandAddStatus(Integer handAddStatus) {
        this.handAddStatus = handAddStatus;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", productAttributeCategoryId=").append(productAttributeCategoryId);
        sb.append(", name=").append(name);
        sb.append(", selectType=").append(selectType);
        sb.append(", inputType=").append(inputType);
        sb.append(", inputList=").append(inputList);
        sb.append(", sort=").append(sort);
        sb.append(", searchType=").append(searchType);
        sb.append(", handAddStatus=").append(handAddStatus);
        sb.append(", type=").append(type);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}