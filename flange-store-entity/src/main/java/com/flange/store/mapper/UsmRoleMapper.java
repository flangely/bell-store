package com.flange.store.mapper;

import com.flange.store.model.UsmRole;
import com.flange.store.model.UsmRoleExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface UsmRoleMapper {
    int countByExample(UsmRoleExample example);

    int deleteByExample(UsmRoleExample example);

    int deleteByPrimaryKey(String id);

    int insert(UsmRole record);

    int insertSelective(UsmRole record);

    List<UsmRole> selectByExample(UsmRoleExample example);

    UsmRole selectByPrimaryKey(String id);

    int updateByExampleSelective(@Param("record") UsmRole record, @Param("example") UsmRoleExample example);

    int updateByExample(@Param("record") UsmRole record, @Param("example") UsmRoleExample example);

    int updateByPrimaryKeySelective(UsmRole record);

    int updateByPrimaryKey(UsmRole record);
}