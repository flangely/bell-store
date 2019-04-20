package com.flange.store.portal.service.impl;

import com.flange.store.mapper.OmsCartItemMapper;
import com.flange.store.model.OmsCartItem;
import com.flange.store.model.OmsCartItemExample;
import com.flange.store.model.UmsMember;
import com.flange.store.portal.dao.PortalProductDao;
import com.flange.store.portal.domain.CartProduct;
import com.flange.store.portal.service.OmsCartItemService;
import com.flange.store.portal.service.UmsMemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;
import java.util.Date;
import java.util.List;

/**
 * @author flangely
 * @create 2019-04-20
 * <p>
 * 9:00 AM
 */
@Service
public class OmsCartItemServiceImpl implements OmsCartItemService {

    @Autowired
    private OmsCartItemMapper cartItemMapper;

    @Autowired
    private PortalProductDao productDao;

    @Autowired
    private UmsMemberService memberService;


    @Override
    public int add(OmsCartItem cartItem) {
        int count;
        UmsMember currentMember = memberService.getCurrentMember();
        cartItem.setMemberId(currentMember.getId());
        cartItem.setMemberNickname(currentMember.getNickname());
        cartItem.setDeleteStatus(0);
        OmsCartItem existCartItem = getCartItem(cartItem);
        if (existCartItem == null){
            cartItem.setCreateDate(new Date());
            count = cartItemMapper.insert(cartItem);
        }else {
            existCartItem.setModifyDate(new Date());
            existCartItem.setQuantity(existCartItem.getQuantity() + cartItem.getQuantity());
            count = cartItemMapper.updateByPrimaryKey(existCartItem);
        }
        return count;
    }

    @Override
    public List<OmsCartItem> list(String memberId) {
        OmsCartItemExample example = new OmsCartItemExample();
        example.createCriteria().andMemberIdEqualTo(memberId).andDeleteStatusEqualTo(0);
        return cartItemMapper.selectByExample(example);
    }


    @Override
    public int updateQuantity(String id, String memberId, Integer quantity) {
        OmsCartItem cartItem = new OmsCartItem();
        cartItem.setQuantity(quantity);
        OmsCartItemExample example = new OmsCartItemExample();
        example.createCriteria().andIdEqualTo(id).andMemberIdEqualTo(memberId).andDeleteStatusEqualTo(0);
        return cartItemMapper.updateByExampleSelective(cartItem, example);
    }

    @Override
    public int delete(String memberId, List<String> ids) {
        OmsCartItem cartItem = new OmsCartItem();
        cartItem.setDeleteStatus(1);
        OmsCartItemExample example = new OmsCartItemExample();
        example.createCriteria().andMemberIdEqualTo(memberId).andIdIn(ids);
        return cartItemMapper.updateByExampleSelective(cartItem, example);
    }

    @Override
    public CartProduct getCartProduct(String productId) {
        return productDao.getCartProduct(productId);
    }


    private OmsCartItem getCartItem(OmsCartItem cartItem){
        OmsCartItemExample example = new OmsCartItemExample();
        example.createCriteria().andMemberIdEqualTo(cartItem.getMemberId()).andProductIdEqualTo(cartItem.getProductId());
        List<OmsCartItem> cartItemList = cartItemMapper.selectByExample(example);
        if (!CollectionUtils.isEmpty(cartItemList)){
            return cartItemList.get(0);
        }
        return null;
    }

    @Override
    public int updateAttr(OmsCartItem cartItem) {
        //删除原购物车信息
        OmsCartItem updateCart = new OmsCartItem();
        updateCart.setId(cartItem.getId());
        updateCart.setModifyDate(new Date());
        updateCart.setDeleteStatus(1);
        cartItemMapper.updateByPrimaryKeySelective(updateCart);
        cartItem.setId(null);
        add(cartItem);
        return 1;
    }

    @Override
    public int clear(String memberId) {
        OmsCartItem record = new OmsCartItem();
        record.setDeleteStatus(1);
        OmsCartItemExample example = new OmsCartItemExample();
        example.createCriteria().andMemberIdEqualTo(memberId);
        return cartItemMapper.updateByExampleSelective(record, example);
    }
}
