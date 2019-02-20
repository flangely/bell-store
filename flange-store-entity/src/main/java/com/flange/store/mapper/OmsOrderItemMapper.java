package com.flange.store.mapper;

import com.flange.store.model.OmsOrderItem;
import com.flange.store.model.OmsOrderItemExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface OmsOrderItemMapper {
    int countByExample(OmsOrderItemExample example);

    int deleteByExample(OmsOrderItemExample example);

    int deleteByPrimaryKey(String id);

    int insert(OmsOrderItem record);

    int insertSelective(OmsOrderItem record);

    List<OmsOrderItem> selectByExample(OmsOrderItemExample example);

    OmsOrderItem selectByPrimaryKey(String id);

    int updateByExampleSelective(@Param("record") OmsOrderItem record, @Param("example") OmsOrderItemExample example);

    int updateByExample(@Param("record") OmsOrderItem record, @Param("example") OmsOrderItemExample example);

    int updateByPrimaryKeySelective(OmsOrderItem record);

    int updateByPrimaryKey(OmsOrderItem record);
}