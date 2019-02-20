package com.flange.store.mapper;

import com.flange.store.model.PmsProductAttributeValue;
import com.flange.store.model.PmsProductAttributeValueExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface PmsProductAttributeValueMapper {
    int countByExample(PmsProductAttributeValueExample example);

    int deleteByExample(PmsProductAttributeValueExample example);

    int deleteByPrimaryKey(String id);

    int insert(PmsProductAttributeValue record);

    int insertSelective(PmsProductAttributeValue record);

    List<PmsProductAttributeValue> selectByExample(PmsProductAttributeValueExample example);

    PmsProductAttributeValue selectByPrimaryKey(String id);

    int updateByExampleSelective(@Param("record") PmsProductAttributeValue record, @Param("example") PmsProductAttributeValueExample example);

    int updateByExample(@Param("record") PmsProductAttributeValue record, @Param("example") PmsProductAttributeValueExample example);

    int updateByPrimaryKeySelective(PmsProductAttributeValue record);

    int updateByPrimaryKey(PmsProductAttributeValue record);
}