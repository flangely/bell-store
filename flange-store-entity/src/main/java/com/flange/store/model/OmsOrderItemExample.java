package com.flange.store.model;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

public class OmsOrderItemExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public OmsOrderItemExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andIdIsNull() {
            addCriterion("id is null");
            return (Criteria) this;
        }

        public Criteria andIdIsNotNull() {
            addCriterion("id is not null");
            return (Criteria) this;
        }

        public Criteria andIdEqualTo(String value) {
            addCriterion("id =", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotEqualTo(String value) {
            addCriterion("id <>", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThan(String value) {
            addCriterion("id >", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThanOrEqualTo(String value) {
            addCriterion("id >=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThan(String value) {
            addCriterion("id <", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThanOrEqualTo(String value) {
            addCriterion("id <=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLike(String value) {
            addCriterion("id like", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotLike(String value) {
            addCriterion("id not like", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdIn(List<String> values) {
            addCriterion("id in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotIn(List<String> values) {
            addCriterion("id not in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdBetween(String value1, String value2) {
            addCriterion("id between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotBetween(String value1, String value2) {
            addCriterion("id not between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andOrderIdIsNull() {
            addCriterion("order_id is null");
            return (Criteria) this;
        }

        public Criteria andOrderIdIsNotNull() {
            addCriterion("order_id is not null");
            return (Criteria) this;
        }

        public Criteria andOrderIdEqualTo(String value) {
            addCriterion("order_id =", value, "orderId");
            return (Criteria) this;
        }

        public Criteria andOrderIdNotEqualTo(String value) {
            addCriterion("order_id <>", value, "orderId");
            return (Criteria) this;
        }

        public Criteria andOrderIdGreaterThan(String value) {
            addCriterion("order_id >", value, "orderId");
            return (Criteria) this;
        }

        public Criteria andOrderIdGreaterThanOrEqualTo(String value) {
            addCriterion("order_id >=", value, "orderId");
            return (Criteria) this;
        }

        public Criteria andOrderIdLessThan(String value) {
            addCriterion("order_id <", value, "orderId");
            return (Criteria) this;
        }

        public Criteria andOrderIdLessThanOrEqualTo(String value) {
            addCriterion("order_id <=", value, "orderId");
            return (Criteria) this;
        }

        public Criteria andOrderIdLike(String value) {
            addCriterion("order_id like", value, "orderId");
            return (Criteria) this;
        }

        public Criteria andOrderIdNotLike(String value) {
            addCriterion("order_id not like", value, "orderId");
            return (Criteria) this;
        }

        public Criteria andOrderIdIn(List<String> values) {
            addCriterion("order_id in", values, "orderId");
            return (Criteria) this;
        }

        public Criteria andOrderIdNotIn(List<String> values) {
            addCriterion("order_id not in", values, "orderId");
            return (Criteria) this;
        }

        public Criteria andOrderIdBetween(String value1, String value2) {
            addCriterion("order_id between", value1, value2, "orderId");
            return (Criteria) this;
        }

        public Criteria andOrderIdNotBetween(String value1, String value2) {
            addCriterion("order_id not between", value1, value2, "orderId");
            return (Criteria) this;
        }

        public Criteria andOrderSnIsNull() {
            addCriterion("order_sn is null");
            return (Criteria) this;
        }

        public Criteria andOrderSnIsNotNull() {
            addCriterion("order_sn is not null");
            return (Criteria) this;
        }

        public Criteria andOrderSnEqualTo(String value) {
            addCriterion("order_sn =", value, "orderSn");
            return (Criteria) this;
        }

        public Criteria andOrderSnNotEqualTo(String value) {
            addCriterion("order_sn <>", value, "orderSn");
            return (Criteria) this;
        }

        public Criteria andOrderSnGreaterThan(String value) {
            addCriterion("order_sn >", value, "orderSn");
            return (Criteria) this;
        }

        public Criteria andOrderSnGreaterThanOrEqualTo(String value) {
            addCriterion("order_sn >=", value, "orderSn");
            return (Criteria) this;
        }

        public Criteria andOrderSnLessThan(String value) {
            addCriterion("order_sn <", value, "orderSn");
            return (Criteria) this;
        }

        public Criteria andOrderSnLessThanOrEqualTo(String value) {
            addCriterion("order_sn <=", value, "orderSn");
            return (Criteria) this;
        }

        public Criteria andOrderSnLike(String value) {
            addCriterion("order_sn like", value, "orderSn");
            return (Criteria) this;
        }

        public Criteria andOrderSnNotLike(String value) {
            addCriterion("order_sn not like", value, "orderSn");
            return (Criteria) this;
        }

        public Criteria andOrderSnIn(List<String> values) {
            addCriterion("order_sn in", values, "orderSn");
            return (Criteria) this;
        }

        public Criteria andOrderSnNotIn(List<String> values) {
            addCriterion("order_sn not in", values, "orderSn");
            return (Criteria) this;
        }

        public Criteria andOrderSnBetween(String value1, String value2) {
            addCriterion("order_sn between", value1, value2, "orderSn");
            return (Criteria) this;
        }

        public Criteria andOrderSnNotBetween(String value1, String value2) {
            addCriterion("order_sn not between", value1, value2, "orderSn");
            return (Criteria) this;
        }

        public Criteria andProductIdIsNull() {
            addCriterion("product_id is null");
            return (Criteria) this;
        }

        public Criteria andProductIdIsNotNull() {
            addCriterion("product_id is not null");
            return (Criteria) this;
        }

        public Criteria andProductIdEqualTo(String value) {
            addCriterion("product_id =", value, "productId");
            return (Criteria) this;
        }

        public Criteria andProductIdNotEqualTo(String value) {
            addCriterion("product_id <>", value, "productId");
            return (Criteria) this;
        }

        public Criteria andProductIdGreaterThan(String value) {
            addCriterion("product_id >", value, "productId");
            return (Criteria) this;
        }

        public Criteria andProductIdGreaterThanOrEqualTo(String value) {
            addCriterion("product_id >=", value, "productId");
            return (Criteria) this;
        }

        public Criteria andProductIdLessThan(String value) {
            addCriterion("product_id <", value, "productId");
            return (Criteria) this;
        }

        public Criteria andProductIdLessThanOrEqualTo(String value) {
            addCriterion("product_id <=", value, "productId");
            return (Criteria) this;
        }

        public Criteria andProductIdLike(String value) {
            addCriterion("product_id like", value, "productId");
            return (Criteria) this;
        }

        public Criteria andProductIdNotLike(String value) {
            addCriterion("product_id not like", value, "productId");
            return (Criteria) this;
        }

        public Criteria andProductIdIn(List<String> values) {
            addCriterion("product_id in", values, "productId");
            return (Criteria) this;
        }

        public Criteria andProductIdNotIn(List<String> values) {
            addCriterion("product_id not in", values, "productId");
            return (Criteria) this;
        }

        public Criteria andProductIdBetween(String value1, String value2) {
            addCriterion("product_id between", value1, value2, "productId");
            return (Criteria) this;
        }

        public Criteria andProductIdNotBetween(String value1, String value2) {
            addCriterion("product_id not between", value1, value2, "productId");
            return (Criteria) this;
        }

        public Criteria andProductPicIsNull() {
            addCriterion("product_pic is null");
            return (Criteria) this;
        }

        public Criteria andProductPicIsNotNull() {
            addCriterion("product_pic is not null");
            return (Criteria) this;
        }

        public Criteria andProductPicEqualTo(String value) {
            addCriterion("product_pic =", value, "productPic");
            return (Criteria) this;
        }

        public Criteria andProductPicNotEqualTo(String value) {
            addCriterion("product_pic <>", value, "productPic");
            return (Criteria) this;
        }

        public Criteria andProductPicGreaterThan(String value) {
            addCriterion("product_pic >", value, "productPic");
            return (Criteria) this;
        }

        public Criteria andProductPicGreaterThanOrEqualTo(String value) {
            addCriterion("product_pic >=", value, "productPic");
            return (Criteria) this;
        }

        public Criteria andProductPicLessThan(String value) {
            addCriterion("product_pic <", value, "productPic");
            return (Criteria) this;
        }

        public Criteria andProductPicLessThanOrEqualTo(String value) {
            addCriterion("product_pic <=", value, "productPic");
            return (Criteria) this;
        }

        public Criteria andProductPicLike(String value) {
            addCriterion("product_pic like", value, "productPic");
            return (Criteria) this;
        }

        public Criteria andProductPicNotLike(String value) {
            addCriterion("product_pic not like", value, "productPic");
            return (Criteria) this;
        }

        public Criteria andProductPicIn(List<String> values) {
            addCriterion("product_pic in", values, "productPic");
            return (Criteria) this;
        }

        public Criteria andProductPicNotIn(List<String> values) {
            addCriterion("product_pic not in", values, "productPic");
            return (Criteria) this;
        }

        public Criteria andProductPicBetween(String value1, String value2) {
            addCriterion("product_pic between", value1, value2, "productPic");
            return (Criteria) this;
        }

        public Criteria andProductPicNotBetween(String value1, String value2) {
            addCriterion("product_pic not between", value1, value2, "productPic");
            return (Criteria) this;
        }

        public Criteria andProductNameIsNull() {
            addCriterion("product_name is null");
            return (Criteria) this;
        }

        public Criteria andProductNameIsNotNull() {
            addCriterion("product_name is not null");
            return (Criteria) this;
        }

        public Criteria andProductNameEqualTo(String value) {
            addCriterion("product_name =", value, "productName");
            return (Criteria) this;
        }

        public Criteria andProductNameNotEqualTo(String value) {
            addCriterion("product_name <>", value, "productName");
            return (Criteria) this;
        }

        public Criteria andProductNameGreaterThan(String value) {
            addCriterion("product_name >", value, "productName");
            return (Criteria) this;
        }

        public Criteria andProductNameGreaterThanOrEqualTo(String value) {
            addCriterion("product_name >=", value, "productName");
            return (Criteria) this;
        }

        public Criteria andProductNameLessThan(String value) {
            addCriterion("product_name <", value, "productName");
            return (Criteria) this;
        }

        public Criteria andProductNameLessThanOrEqualTo(String value) {
            addCriterion("product_name <=", value, "productName");
            return (Criteria) this;
        }

        public Criteria andProductNameLike(String value) {
            addCriterion("product_name like", value, "productName");
            return (Criteria) this;
        }

        public Criteria andProductNameNotLike(String value) {
            addCriterion("product_name not like", value, "productName");
            return (Criteria) this;
        }

        public Criteria andProductNameIn(List<String> values) {
            addCriterion("product_name in", values, "productName");
            return (Criteria) this;
        }

        public Criteria andProductNameNotIn(List<String> values) {
            addCriterion("product_name not in", values, "productName");
            return (Criteria) this;
        }

        public Criteria andProductNameBetween(String value1, String value2) {
            addCriterion("product_name between", value1, value2, "productName");
            return (Criteria) this;
        }

        public Criteria andProductNameNotBetween(String value1, String value2) {
            addCriterion("product_name not between", value1, value2, "productName");
            return (Criteria) this;
        }

        public Criteria andProductBrandIsNull() {
            addCriterion("product_brand is null");
            return (Criteria) this;
        }

        public Criteria andProductBrandIsNotNull() {
            addCriterion("product_brand is not null");
            return (Criteria) this;
        }

        public Criteria andProductBrandEqualTo(String value) {
            addCriterion("product_brand =", value, "productBrand");
            return (Criteria) this;
        }

        public Criteria andProductBrandNotEqualTo(String value) {
            addCriterion("product_brand <>", value, "productBrand");
            return (Criteria) this;
        }

        public Criteria andProductBrandGreaterThan(String value) {
            addCriterion("product_brand >", value, "productBrand");
            return (Criteria) this;
        }

        public Criteria andProductBrandGreaterThanOrEqualTo(String value) {
            addCriterion("product_brand >=", value, "productBrand");
            return (Criteria) this;
        }

        public Criteria andProductBrandLessThan(String value) {
            addCriterion("product_brand <", value, "productBrand");
            return (Criteria) this;
        }

        public Criteria andProductBrandLessThanOrEqualTo(String value) {
            addCriterion("product_brand <=", value, "productBrand");
            return (Criteria) this;
        }

        public Criteria andProductBrandLike(String value) {
            addCriterion("product_brand like", value, "productBrand");
            return (Criteria) this;
        }

        public Criteria andProductBrandNotLike(String value) {
            addCriterion("product_brand not like", value, "productBrand");
            return (Criteria) this;
        }

        public Criteria andProductBrandIn(List<String> values) {
            addCriterion("product_brand in", values, "productBrand");
            return (Criteria) this;
        }

        public Criteria andProductBrandNotIn(List<String> values) {
            addCriterion("product_brand not in", values, "productBrand");
            return (Criteria) this;
        }

        public Criteria andProductBrandBetween(String value1, String value2) {
            addCriterion("product_brand between", value1, value2, "productBrand");
            return (Criteria) this;
        }

        public Criteria andProductBrandNotBetween(String value1, String value2) {
            addCriterion("product_brand not between", value1, value2, "productBrand");
            return (Criteria) this;
        }

        public Criteria andProductSnIsNull() {
            addCriterion("product_sn is null");
            return (Criteria) this;
        }

        public Criteria andProductSnIsNotNull() {
            addCriterion("product_sn is not null");
            return (Criteria) this;
        }

        public Criteria andProductSnEqualTo(String value) {
            addCriterion("product_sn =", value, "productSn");
            return (Criteria) this;
        }

        public Criteria andProductSnNotEqualTo(String value) {
            addCriterion("product_sn <>", value, "productSn");
            return (Criteria) this;
        }

        public Criteria andProductSnGreaterThan(String value) {
            addCriterion("product_sn >", value, "productSn");
            return (Criteria) this;
        }

        public Criteria andProductSnGreaterThanOrEqualTo(String value) {
            addCriterion("product_sn >=", value, "productSn");
            return (Criteria) this;
        }

        public Criteria andProductSnLessThan(String value) {
            addCriterion("product_sn <", value, "productSn");
            return (Criteria) this;
        }

        public Criteria andProductSnLessThanOrEqualTo(String value) {
            addCriterion("product_sn <=", value, "productSn");
            return (Criteria) this;
        }

        public Criteria andProductSnLike(String value) {
            addCriterion("product_sn like", value, "productSn");
            return (Criteria) this;
        }

        public Criteria andProductSnNotLike(String value) {
            addCriterion("product_sn not like", value, "productSn");
            return (Criteria) this;
        }

        public Criteria andProductSnIn(List<String> values) {
            addCriterion("product_sn in", values, "productSn");
            return (Criteria) this;
        }

        public Criteria andProductSnNotIn(List<String> values) {
            addCriterion("product_sn not in", values, "productSn");
            return (Criteria) this;
        }

        public Criteria andProductSnBetween(String value1, String value2) {
            addCriterion("product_sn between", value1, value2, "productSn");
            return (Criteria) this;
        }

        public Criteria andProductSnNotBetween(String value1, String value2) {
            addCriterion("product_sn not between", value1, value2, "productSn");
            return (Criteria) this;
        }

        public Criteria andProductPriceIsNull() {
            addCriterion("product_price is null");
            return (Criteria) this;
        }

        public Criteria andProductPriceIsNotNull() {
            addCriterion("product_price is not null");
            return (Criteria) this;
        }

        public Criteria andProductPriceEqualTo(BigDecimal value) {
            addCriterion("product_price =", value, "productPrice");
            return (Criteria) this;
        }

        public Criteria andProductPriceNotEqualTo(BigDecimal value) {
            addCriterion("product_price <>", value, "productPrice");
            return (Criteria) this;
        }

        public Criteria andProductPriceGreaterThan(BigDecimal value) {
            addCriterion("product_price >", value, "productPrice");
            return (Criteria) this;
        }

        public Criteria andProductPriceGreaterThanOrEqualTo(BigDecimal value) {
            addCriterion("product_price >=", value, "productPrice");
            return (Criteria) this;
        }

        public Criteria andProductPriceLessThan(BigDecimal value) {
            addCriterion("product_price <", value, "productPrice");
            return (Criteria) this;
        }

        public Criteria andProductPriceLessThanOrEqualTo(BigDecimal value) {
            addCriterion("product_price <=", value, "productPrice");
            return (Criteria) this;
        }

        public Criteria andProductPriceIn(List<BigDecimal> values) {
            addCriterion("product_price in", values, "productPrice");
            return (Criteria) this;
        }

        public Criteria andProductPriceNotIn(List<BigDecimal> values) {
            addCriterion("product_price not in", values, "productPrice");
            return (Criteria) this;
        }

        public Criteria andProductPriceBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("product_price between", value1, value2, "productPrice");
            return (Criteria) this;
        }

        public Criteria andProductPriceNotBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("product_price not between", value1, value2, "productPrice");
            return (Criteria) this;
        }

        public Criteria andProductQuantityIsNull() {
            addCriterion("product_quantity is null");
            return (Criteria) this;
        }

        public Criteria andProductQuantityIsNotNull() {
            addCriterion("product_quantity is not null");
            return (Criteria) this;
        }

        public Criteria andProductQuantityEqualTo(Integer value) {
            addCriterion("product_quantity =", value, "productQuantity");
            return (Criteria) this;
        }

        public Criteria andProductQuantityNotEqualTo(Integer value) {
            addCriterion("product_quantity <>", value, "productQuantity");
            return (Criteria) this;
        }

        public Criteria andProductQuantityGreaterThan(Integer value) {
            addCriterion("product_quantity >", value, "productQuantity");
            return (Criteria) this;
        }

        public Criteria andProductQuantityGreaterThanOrEqualTo(Integer value) {
            addCriterion("product_quantity >=", value, "productQuantity");
            return (Criteria) this;
        }

        public Criteria andProductQuantityLessThan(Integer value) {
            addCriterion("product_quantity <", value, "productQuantity");
            return (Criteria) this;
        }

        public Criteria andProductQuantityLessThanOrEqualTo(Integer value) {
            addCriterion("product_quantity <=", value, "productQuantity");
            return (Criteria) this;
        }

        public Criteria andProductQuantityIn(List<Integer> values) {
            addCriterion("product_quantity in", values, "productQuantity");
            return (Criteria) this;
        }

        public Criteria andProductQuantityNotIn(List<Integer> values) {
            addCriterion("product_quantity not in", values, "productQuantity");
            return (Criteria) this;
        }

        public Criteria andProductQuantityBetween(Integer value1, Integer value2) {
            addCriterion("product_quantity between", value1, value2, "productQuantity");
            return (Criteria) this;
        }

        public Criteria andProductQuantityNotBetween(Integer value1, Integer value2) {
            addCriterion("product_quantity not between", value1, value2, "productQuantity");
            return (Criteria) this;
        }

        public Criteria andProductSkuIdIsNull() {
            addCriterion("product_sku_id is null");
            return (Criteria) this;
        }

        public Criteria andProductSkuIdIsNotNull() {
            addCriterion("product_sku_id is not null");
            return (Criteria) this;
        }

        public Criteria andProductSkuIdEqualTo(String value) {
            addCriterion("product_sku_id =", value, "productSkuId");
            return (Criteria) this;
        }

        public Criteria andProductSkuIdNotEqualTo(String value) {
            addCriterion("product_sku_id <>", value, "productSkuId");
            return (Criteria) this;
        }

        public Criteria andProductSkuIdGreaterThan(String value) {
            addCriterion("product_sku_id >", value, "productSkuId");
            return (Criteria) this;
        }

        public Criteria andProductSkuIdGreaterThanOrEqualTo(String value) {
            addCriterion("product_sku_id >=", value, "productSkuId");
            return (Criteria) this;
        }

        public Criteria andProductSkuIdLessThan(String value) {
            addCriterion("product_sku_id <", value, "productSkuId");
            return (Criteria) this;
        }

        public Criteria andProductSkuIdLessThanOrEqualTo(String value) {
            addCriterion("product_sku_id <=", value, "productSkuId");
            return (Criteria) this;
        }

        public Criteria andProductSkuIdLike(String value) {
            addCriterion("product_sku_id like", value, "productSkuId");
            return (Criteria) this;
        }

        public Criteria andProductSkuIdNotLike(String value) {
            addCriterion("product_sku_id not like", value, "productSkuId");
            return (Criteria) this;
        }

        public Criteria andProductSkuIdIn(List<String> values) {
            addCriterion("product_sku_id in", values, "productSkuId");
            return (Criteria) this;
        }

        public Criteria andProductSkuIdNotIn(List<String> values) {
            addCriterion("product_sku_id not in", values, "productSkuId");
            return (Criteria) this;
        }

        public Criteria andProductSkuIdBetween(String value1, String value2) {
            addCriterion("product_sku_id between", value1, value2, "productSkuId");
            return (Criteria) this;
        }

        public Criteria andProductSkuIdNotBetween(String value1, String value2) {
            addCriterion("product_sku_id not between", value1, value2, "productSkuId");
            return (Criteria) this;
        }

        public Criteria andProductSkuCodeIsNull() {
            addCriterion("product_sku_code is null");
            return (Criteria) this;
        }

        public Criteria andProductSkuCodeIsNotNull() {
            addCriterion("product_sku_code is not null");
            return (Criteria) this;
        }

        public Criteria andProductSkuCodeEqualTo(String value) {
            addCriterion("product_sku_code =", value, "productSkuCode");
            return (Criteria) this;
        }

        public Criteria andProductSkuCodeNotEqualTo(String value) {
            addCriterion("product_sku_code <>", value, "productSkuCode");
            return (Criteria) this;
        }

        public Criteria andProductSkuCodeGreaterThan(String value) {
            addCriterion("product_sku_code >", value, "productSkuCode");
            return (Criteria) this;
        }

        public Criteria andProductSkuCodeGreaterThanOrEqualTo(String value) {
            addCriterion("product_sku_code >=", value, "productSkuCode");
            return (Criteria) this;
        }

        public Criteria andProductSkuCodeLessThan(String value) {
            addCriterion("product_sku_code <", value, "productSkuCode");
            return (Criteria) this;
        }

        public Criteria andProductSkuCodeLessThanOrEqualTo(String value) {
            addCriterion("product_sku_code <=", value, "productSkuCode");
            return (Criteria) this;
        }

        public Criteria andProductSkuCodeLike(String value) {
            addCriterion("product_sku_code like", value, "productSkuCode");
            return (Criteria) this;
        }

        public Criteria andProductSkuCodeNotLike(String value) {
            addCriterion("product_sku_code not like", value, "productSkuCode");
            return (Criteria) this;
        }

        public Criteria andProductSkuCodeIn(List<String> values) {
            addCriterion("product_sku_code in", values, "productSkuCode");
            return (Criteria) this;
        }

        public Criteria andProductSkuCodeNotIn(List<String> values) {
            addCriterion("product_sku_code not in", values, "productSkuCode");
            return (Criteria) this;
        }

        public Criteria andProductSkuCodeBetween(String value1, String value2) {
            addCriterion("product_sku_code between", value1, value2, "productSkuCode");
            return (Criteria) this;
        }

        public Criteria andProductSkuCodeNotBetween(String value1, String value2) {
            addCriterion("product_sku_code not between", value1, value2, "productSkuCode");
            return (Criteria) this;
        }

        public Criteria andProductCategoryIdIsNull() {
            addCriterion("product_category_id is null");
            return (Criteria) this;
        }

        public Criteria andProductCategoryIdIsNotNull() {
            addCriterion("product_category_id is not null");
            return (Criteria) this;
        }

        public Criteria andProductCategoryIdEqualTo(String value) {
            addCriterion("product_category_id =", value, "productCategoryId");
            return (Criteria) this;
        }

        public Criteria andProductCategoryIdNotEqualTo(String value) {
            addCriterion("product_category_id <>", value, "productCategoryId");
            return (Criteria) this;
        }

        public Criteria andProductCategoryIdGreaterThan(String value) {
            addCriterion("product_category_id >", value, "productCategoryId");
            return (Criteria) this;
        }

        public Criteria andProductCategoryIdGreaterThanOrEqualTo(String value) {
            addCriterion("product_category_id >=", value, "productCategoryId");
            return (Criteria) this;
        }

        public Criteria andProductCategoryIdLessThan(String value) {
            addCriterion("product_category_id <", value, "productCategoryId");
            return (Criteria) this;
        }

        public Criteria andProductCategoryIdLessThanOrEqualTo(String value) {
            addCriterion("product_category_id <=", value, "productCategoryId");
            return (Criteria) this;
        }

        public Criteria andProductCategoryIdLike(String value) {
            addCriterion("product_category_id like", value, "productCategoryId");
            return (Criteria) this;
        }

        public Criteria andProductCategoryIdNotLike(String value) {
            addCriterion("product_category_id not like", value, "productCategoryId");
            return (Criteria) this;
        }

        public Criteria andProductCategoryIdIn(List<String> values) {
            addCriterion("product_category_id in", values, "productCategoryId");
            return (Criteria) this;
        }

        public Criteria andProductCategoryIdNotIn(List<String> values) {
            addCriterion("product_category_id not in", values, "productCategoryId");
            return (Criteria) this;
        }

        public Criteria andProductCategoryIdBetween(String value1, String value2) {
            addCriterion("product_category_id between", value1, value2, "productCategoryId");
            return (Criteria) this;
        }

        public Criteria andProductCategoryIdNotBetween(String value1, String value2) {
            addCriterion("product_category_id not between", value1, value2, "productCategoryId");
            return (Criteria) this;
        }

        public Criteria andSp1IsNull() {
            addCriterion("sp1 is null");
            return (Criteria) this;
        }

        public Criteria andSp1IsNotNull() {
            addCriterion("sp1 is not null");
            return (Criteria) this;
        }

        public Criteria andSp1EqualTo(String value) {
            addCriterion("sp1 =", value, "sp1");
            return (Criteria) this;
        }

        public Criteria andSp1NotEqualTo(String value) {
            addCriterion("sp1 <>", value, "sp1");
            return (Criteria) this;
        }

        public Criteria andSp1GreaterThan(String value) {
            addCriterion("sp1 >", value, "sp1");
            return (Criteria) this;
        }

        public Criteria andSp1GreaterThanOrEqualTo(String value) {
            addCriterion("sp1 >=", value, "sp1");
            return (Criteria) this;
        }

        public Criteria andSp1LessThan(String value) {
            addCriterion("sp1 <", value, "sp1");
            return (Criteria) this;
        }

        public Criteria andSp1LessThanOrEqualTo(String value) {
            addCriterion("sp1 <=", value, "sp1");
            return (Criteria) this;
        }

        public Criteria andSp1Like(String value) {
            addCriterion("sp1 like", value, "sp1");
            return (Criteria) this;
        }

        public Criteria andSp1NotLike(String value) {
            addCriterion("sp1 not like", value, "sp1");
            return (Criteria) this;
        }

        public Criteria andSp1In(List<String> values) {
            addCriterion("sp1 in", values, "sp1");
            return (Criteria) this;
        }

        public Criteria andSp1NotIn(List<String> values) {
            addCriterion("sp1 not in", values, "sp1");
            return (Criteria) this;
        }

        public Criteria andSp1Between(String value1, String value2) {
            addCriterion("sp1 between", value1, value2, "sp1");
            return (Criteria) this;
        }

        public Criteria andSp1NotBetween(String value1, String value2) {
            addCriterion("sp1 not between", value1, value2, "sp1");
            return (Criteria) this;
        }

        public Criteria andSp2IsNull() {
            addCriterion("sp2 is null");
            return (Criteria) this;
        }

        public Criteria andSp2IsNotNull() {
            addCriterion("sp2 is not null");
            return (Criteria) this;
        }

        public Criteria andSp2EqualTo(String value) {
            addCriterion("sp2 =", value, "sp2");
            return (Criteria) this;
        }

        public Criteria andSp2NotEqualTo(String value) {
            addCriterion("sp2 <>", value, "sp2");
            return (Criteria) this;
        }

        public Criteria andSp2GreaterThan(String value) {
            addCriterion("sp2 >", value, "sp2");
            return (Criteria) this;
        }

        public Criteria andSp2GreaterThanOrEqualTo(String value) {
            addCriterion("sp2 >=", value, "sp2");
            return (Criteria) this;
        }

        public Criteria andSp2LessThan(String value) {
            addCriterion("sp2 <", value, "sp2");
            return (Criteria) this;
        }

        public Criteria andSp2LessThanOrEqualTo(String value) {
            addCriterion("sp2 <=", value, "sp2");
            return (Criteria) this;
        }

        public Criteria andSp2Like(String value) {
            addCriterion("sp2 like", value, "sp2");
            return (Criteria) this;
        }

        public Criteria andSp2NotLike(String value) {
            addCriterion("sp2 not like", value, "sp2");
            return (Criteria) this;
        }

        public Criteria andSp2In(List<String> values) {
            addCriterion("sp2 in", values, "sp2");
            return (Criteria) this;
        }

        public Criteria andSp2NotIn(List<String> values) {
            addCriterion("sp2 not in", values, "sp2");
            return (Criteria) this;
        }

        public Criteria andSp2Between(String value1, String value2) {
            addCriterion("sp2 between", value1, value2, "sp2");
            return (Criteria) this;
        }

        public Criteria andSp2NotBetween(String value1, String value2) {
            addCriterion("sp2 not between", value1, value2, "sp2");
            return (Criteria) this;
        }

        public Criteria andSp3IsNull() {
            addCriterion("sp3 is null");
            return (Criteria) this;
        }

        public Criteria andSp3IsNotNull() {
            addCriterion("sp3 is not null");
            return (Criteria) this;
        }

        public Criteria andSp3EqualTo(String value) {
            addCriterion("sp3 =", value, "sp3");
            return (Criteria) this;
        }

        public Criteria andSp3NotEqualTo(String value) {
            addCriterion("sp3 <>", value, "sp3");
            return (Criteria) this;
        }

        public Criteria andSp3GreaterThan(String value) {
            addCriterion("sp3 >", value, "sp3");
            return (Criteria) this;
        }

        public Criteria andSp3GreaterThanOrEqualTo(String value) {
            addCriterion("sp3 >=", value, "sp3");
            return (Criteria) this;
        }

        public Criteria andSp3LessThan(String value) {
            addCriterion("sp3 <", value, "sp3");
            return (Criteria) this;
        }

        public Criteria andSp3LessThanOrEqualTo(String value) {
            addCriterion("sp3 <=", value, "sp3");
            return (Criteria) this;
        }

        public Criteria andSp3Like(String value) {
            addCriterion("sp3 like", value, "sp3");
            return (Criteria) this;
        }

        public Criteria andSp3NotLike(String value) {
            addCriterion("sp3 not like", value, "sp3");
            return (Criteria) this;
        }

        public Criteria andSp3In(List<String> values) {
            addCriterion("sp3 in", values, "sp3");
            return (Criteria) this;
        }

        public Criteria andSp3NotIn(List<String> values) {
            addCriterion("sp3 not in", values, "sp3");
            return (Criteria) this;
        }

        public Criteria andSp3Between(String value1, String value2) {
            addCriterion("sp3 between", value1, value2, "sp3");
            return (Criteria) this;
        }

        public Criteria andSp3NotBetween(String value1, String value2) {
            addCriterion("sp3 not between", value1, value2, "sp3");
            return (Criteria) this;
        }

        public Criteria andProductAttrIsNull() {
            addCriterion("product_attr is null");
            return (Criteria) this;
        }

        public Criteria andProductAttrIsNotNull() {
            addCriterion("product_attr is not null");
            return (Criteria) this;
        }

        public Criteria andProductAttrEqualTo(String value) {
            addCriterion("product_attr =", value, "productAttr");
            return (Criteria) this;
        }

        public Criteria andProductAttrNotEqualTo(String value) {
            addCriterion("product_attr <>", value, "productAttr");
            return (Criteria) this;
        }

        public Criteria andProductAttrGreaterThan(String value) {
            addCriterion("product_attr >", value, "productAttr");
            return (Criteria) this;
        }

        public Criteria andProductAttrGreaterThanOrEqualTo(String value) {
            addCriterion("product_attr >=", value, "productAttr");
            return (Criteria) this;
        }

        public Criteria andProductAttrLessThan(String value) {
            addCriterion("product_attr <", value, "productAttr");
            return (Criteria) this;
        }

        public Criteria andProductAttrLessThanOrEqualTo(String value) {
            addCriterion("product_attr <=", value, "productAttr");
            return (Criteria) this;
        }

        public Criteria andProductAttrLike(String value) {
            addCriterion("product_attr like", value, "productAttr");
            return (Criteria) this;
        }

        public Criteria andProductAttrNotLike(String value) {
            addCriterion("product_attr not like", value, "productAttr");
            return (Criteria) this;
        }

        public Criteria andProductAttrIn(List<String> values) {
            addCriterion("product_attr in", values, "productAttr");
            return (Criteria) this;
        }

        public Criteria andProductAttrNotIn(List<String> values) {
            addCriterion("product_attr not in", values, "productAttr");
            return (Criteria) this;
        }

        public Criteria andProductAttrBetween(String value1, String value2) {
            addCriterion("product_attr between", value1, value2, "productAttr");
            return (Criteria) this;
        }

        public Criteria andProductAttrNotBetween(String value1, String value2) {
            addCriterion("product_attr not between", value1, value2, "productAttr");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}