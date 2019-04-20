package com.flange.store.portal.service;

import com.flange.store.model.OmsCartItem;
import com.flange.store.portal.domain.CartProduct;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author flangely
 * @create 2019-04-20
 * <p> 购物车管理Service
 * 8:58 AM
 */
public interface OmsCartItemService {
    /**
     * 查询购物车中是否包含该商品，有增加数量，无添加到购物车
     */
    @Transactional
    int add(OmsCartItem cartItem);

    /**
     * 根据会员编号获取购物车列表
     */
    List<OmsCartItem> list(String memberId);


//    /**
//     * 获取包含促销活动信息的购物车列表
//     */
//    List<CartPromotionItem> listPromotion(Long memberId);
    

    /**
     * 修改某个购物车商品的数量
     */
    int updateQuantity(String id, String memberId, Integer quantity);

    /**
     * 批量删除购物车中的商品
     */
    int delete(String memberId,List<String> ids);

    /**
     *获取购物车中用于选择商品规格的商品信息
     */
    CartProduct getCartProduct(String productId);

    /**
     * 修改购物车中商品的规格
     */
    @Transactional
    int updateAttr(OmsCartItem cartItem);

    /**
     * 清空购物车
     */
    int clear(String memberId);
}

