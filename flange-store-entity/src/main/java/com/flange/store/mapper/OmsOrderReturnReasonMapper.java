package com.flange.store.mapper;

import com.flange.store.model.OmsOrderReturnReason;
import com.flange.store.model.OmsOrderReturnReasonExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface OmsOrderReturnReasonMapper {
    int countByExample(OmsOrderReturnReasonExample example);

    int deleteByExample(OmsOrderReturnReasonExample example);

    int deleteByPrimaryKey(String id);

    int insert(OmsOrderReturnReason record);

    int insertSelective(OmsOrderReturnReason record);

    List<OmsOrderReturnReason> selectByExample(OmsOrderReturnReasonExample example);

    OmsOrderReturnReason selectByPrimaryKey(String id);

    int updateByExampleSelective(@Param("record") OmsOrderReturnReason record, @Param("example") OmsOrderReturnReasonExample example);

    int updateByExample(@Param("record") OmsOrderReturnReason record, @Param("example") OmsOrderReturnReasonExample example);

    int updateByPrimaryKeySelective(OmsOrderReturnReason record);

    int updateByPrimaryKey(OmsOrderReturnReason record);
}