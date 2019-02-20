package com.flange.store.mapper;

import com.flange.store.model.OmsOrderReturnApply;
import com.flange.store.model.OmsOrderReturnApplyExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface OmsOrderReturnApplyMapper {
    int countByExample(OmsOrderReturnApplyExample example);

    int deleteByExample(OmsOrderReturnApplyExample example);

    int deleteByPrimaryKey(String id);

    int insert(OmsOrderReturnApply record);

    int insertSelective(OmsOrderReturnApply record);

    List<OmsOrderReturnApply> selectByExample(OmsOrderReturnApplyExample example);

    OmsOrderReturnApply selectByPrimaryKey(String id);

    int updateByExampleSelective(@Param("record") OmsOrderReturnApply record, @Param("example") OmsOrderReturnApplyExample example);

    int updateByExample(@Param("record") OmsOrderReturnApply record, @Param("example") OmsOrderReturnApplyExample example);

    int updateByPrimaryKeySelective(OmsOrderReturnApply record);

    int updateByPrimaryKey(OmsOrderReturnApply record);
}