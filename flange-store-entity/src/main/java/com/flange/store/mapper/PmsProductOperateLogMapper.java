package com.flange.store.mapper;

import com.flange.store.model.PmsProductOperateLog;
import com.flange.store.model.PmsProductOperateLogExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface PmsProductOperateLogMapper {
    int countByExample(PmsProductOperateLogExample example);

    int deleteByExample(PmsProductOperateLogExample example);

    int deleteByPrimaryKey(String id);

    int insert(PmsProductOperateLog record);

    int insertSelective(PmsProductOperateLog record);

    List<PmsProductOperateLog> selectByExample(PmsProductOperateLogExample example);

    PmsProductOperateLog selectByPrimaryKey(String id);

    int updateByExampleSelective(@Param("record") PmsProductOperateLog record, @Param("example") PmsProductOperateLogExample example);

    int updateByExample(@Param("record") PmsProductOperateLog record, @Param("example") PmsProductOperateLogExample example);

    int updateByPrimaryKeySelective(PmsProductOperateLog record);

    int updateByPrimaryKey(PmsProductOperateLog record);
}