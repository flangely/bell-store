package com.flange.store.mapper;

import com.flange.store.model.UsmAdmin;
import com.flange.store.model.UsmAdminExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface UsmAdminMapper {
    int countByExample(UsmAdminExample example);

    int deleteByExample(UsmAdminExample example);

    int deleteByPrimaryKey(String id);

    int insert(UsmAdmin record);

    int insertSelective(UsmAdmin record);

    List<UsmAdmin> selectByExample(UsmAdminExample example);

    UsmAdmin selectByPrimaryKey(String id);

    int updateByExampleSelective(@Param("record") UsmAdmin record, @Param("example") UsmAdminExample example);

    int updateByExample(@Param("record") UsmAdmin record, @Param("example") UsmAdminExample example);

    int updateByPrimaryKeySelective(UsmAdmin record);

    int updateByPrimaryKey(UsmAdmin record);
}