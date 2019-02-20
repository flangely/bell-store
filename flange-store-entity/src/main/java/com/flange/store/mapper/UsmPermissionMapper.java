package com.flange.store.mapper;

import com.flange.store.model.UsmPermission;
import com.flange.store.model.UsmPermissionExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface UsmPermissionMapper {
    int countByExample(UsmPermissionExample example);

    int deleteByExample(UsmPermissionExample example);

    int deleteByPrimaryKey(String id);

    int insert(UsmPermission record);

    int insertSelective(UsmPermission record);

    List<UsmPermission> selectByExample(UsmPermissionExample example);

    UsmPermission selectByPrimaryKey(String id);

    int updateByExampleSelective(@Param("record") UsmPermission record, @Param("example") UsmPermissionExample example);

    int updateByExample(@Param("record") UsmPermission record, @Param("example") UsmPermissionExample example);

    int updateByPrimaryKeySelective(UsmPermission record);

    int updateByPrimaryKey(UsmPermission record);
}