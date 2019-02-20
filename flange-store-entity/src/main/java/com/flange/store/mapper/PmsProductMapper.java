package com.flange.store.mapper;

import com.flange.store.model.PmsProduct;
import com.flange.store.model.PmsProductExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface PmsProductMapper {
    int countByExample(PmsProductExample example);

    int deleteByExample(PmsProductExample example);

    int deleteByPrimaryKey(String id);

    int insert(PmsProduct record);

    int insertSelective(PmsProduct record);

    List<PmsProduct> selectByExampleWithBLOBs(PmsProductExample example);

    List<PmsProduct> selectByExample(PmsProductExample example);

    PmsProduct selectByPrimaryKey(String id);

    int updateByExampleSelective(@Param("record") PmsProduct record, @Param("example") PmsProductExample example);

    int updateByExampleWithBLOBs(@Param("record") PmsProduct record, @Param("example") PmsProductExample example);

    int updateByExample(@Param("record") PmsProduct record, @Param("example") PmsProductExample example);

    int updateByPrimaryKeySelective(PmsProduct record);

    int updateByPrimaryKeyWithBLOBs(PmsProduct record);

    int updateByPrimaryKey(PmsProduct record);
}