package com.flange.store.portal.domain;

import com.flange.store.model.OmsCartItem;

import java.math.BigDecimal;

/**
 * @author flangely
 * @create 2019-04-20
 * <p> 购物车中商品信息的封装
 * 3:29 PM
 */
public class CartPromotionItem extends OmsCartItem {
    //减去的金额，针对每个商品
    private BigDecimal reduceAmount;
    //商品的真实库存（剩余库存-锁定库存）
    private Integer realStock;

    public BigDecimal getReduceAmount() {
        return reduceAmount;
    }

    public void setReduceAmount(BigDecimal reduceAmount) {
        this.reduceAmount = reduceAmount;
    }

    public Integer getRealStock() {
        return realStock;
    }

    public void setRealStock(Integer realStock) {
        this.realStock = realStock;
    }

}
