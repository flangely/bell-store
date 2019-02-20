package com.flange.store.mapper;

import com.flange.store.model.UmsMemberLoginLog;
import com.flange.store.model.UmsMemberLoginLogExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface UmsMemberLoginLogMapper {
    int countByExample(UmsMemberLoginLogExample example);

    int deleteByExample(UmsMemberLoginLogExample example);

    int deleteByPrimaryKey(String id);

    int insert(UmsMemberLoginLog record);

    int insertSelective(UmsMemberLoginLog record);

    List<UmsMemberLoginLog> selectByExample(UmsMemberLoginLogExample example);

    UmsMemberLoginLog selectByPrimaryKey(String id);

    int updateByExampleSelective(@Param("record") UmsMemberLoginLog record, @Param("example") UmsMemberLoginLogExample example);

    int updateByExample(@Param("record") UmsMemberLoginLog record, @Param("example") UmsMemberLoginLogExample example);

    int updateByPrimaryKeySelective(UmsMemberLoginLog record);

    int updateByPrimaryKey(UmsMemberLoginLog record);
}