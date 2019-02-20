package com.flange.store.mapper;

import com.flange.store.model.UsmRolePermissionRelation;
import com.flange.store.model.UsmRolePermissionRelationExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface UsmRolePermissionRelationMapper {
    int countByExample(UsmRolePermissionRelationExample example);

    int deleteByExample(UsmRolePermissionRelationExample example);

    int deleteByPrimaryKey(String id);

    int insert(UsmRolePermissionRelation record);

    int insertSelective(UsmRolePermissionRelation record);

    List<UsmRolePermissionRelation> selectByExample(UsmRolePermissionRelationExample example);

    UsmRolePermissionRelation selectByPrimaryKey(String id);

    int updateByExampleSelective(@Param("record") UsmRolePermissionRelation record, @Param("example") UsmRolePermissionRelationExample example);

    int updateByExample(@Param("record") UsmRolePermissionRelation record, @Param("example") UsmRolePermissionRelationExample example);

    int updateByPrimaryKeySelective(UsmRolePermissionRelation record);

    int updateByPrimaryKey(UsmRolePermissionRelation record);
}