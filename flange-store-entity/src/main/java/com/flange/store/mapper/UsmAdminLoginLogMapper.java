package com.flange.store.mapper;

import com.flange.store.model.UsmAdminLoginLog;
import com.flange.store.model.UsmAdminLoginLogExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface UsmAdminLoginLogMapper {
    int countByExample(UsmAdminLoginLogExample example);

    int deleteByExample(UsmAdminLoginLogExample example);

    int deleteByPrimaryKey(String id);

    int insert(UsmAdminLoginLog record);

    int insertSelective(UsmAdminLoginLog record);

    List<UsmAdminLoginLog> selectByExample(UsmAdminLoginLogExample example);

    UsmAdminLoginLog selectByPrimaryKey(String id);

    int updateByExampleSelective(@Param("record") UsmAdminLoginLog record, @Param("example") UsmAdminLoginLogExample example);

    int updateByExample(@Param("record") UsmAdminLoginLog record, @Param("example") UsmAdminLoginLogExample example);

    int updateByPrimaryKeySelective(UsmAdminLoginLog record);

    int updateByPrimaryKey(UsmAdminLoginLog record);
}