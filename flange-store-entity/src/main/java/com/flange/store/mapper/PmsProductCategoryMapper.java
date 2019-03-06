package com.flange.store.mapper;

import com.flange.store.model.PmsProductCategory;
import com.flange.store.model.PmsProductCategoryExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface PmsProductCategoryMapper {
    int countByExample(PmsProductCategoryExample example);

    int deleteByExample(PmsProductCategoryExample example);

    int deleteByPrimaryKey(String id);

    int insert(PmsProductCategory record);

    int insertSelective(PmsProductCategory record);

    List<PmsProductCategory> selectByExampleWithBLOBs(PmsProductCategoryExample example);

    List<PmsProductCategory> selectByExample(PmsProductCategoryExample example);

    PmsProductCategory selectByPrimaryKey(String id);

    int updateByExampleSelective(@Param("record") PmsProductCategory record, @Param("example") PmsProductCategoryExample example);

    int updateByExampleWithBLOBs(@Param("record") PmsProductCategory record, @Param("example") PmsProductCategoryExample example);

    int updateByExample(@Param("record") PmsProductCategory record, @Param("example") PmsProductCategoryExample example);

    int updateByPrimaryKeySelective(PmsProductCategory record);

    int updateByPrimaryKeyWithBLOBs(PmsProductCategory record);

    int updateByPrimaryKey(PmsProductCategory record);
}