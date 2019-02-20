package com.flange.store.mapper;

import com.flange.store.model.OmsOrder;
import com.flange.store.model.OmsOrderExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface OmsOrderMapper {
    int countByExample(OmsOrderExample example);

    int deleteByExample(OmsOrderExample example);

    int deleteByPrimaryKey(String id);

    int insert(OmsOrder record);

    int insertSelective(OmsOrder record);

    List<OmsOrder> selectByExample(OmsOrderExample example);

    OmsOrder selectByPrimaryKey(String id);

    int updateByExampleSelective(@Param("record") OmsOrder record, @Param("example") OmsOrderExample example);

    int updateByExample(@Param("record") OmsOrder record, @Param("example") OmsOrderExample example);

    int updateByPrimaryKeySelective(OmsOrder record);

    int updateByPrimaryKey(OmsOrder record);
}