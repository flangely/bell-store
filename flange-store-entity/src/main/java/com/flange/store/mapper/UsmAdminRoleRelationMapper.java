package com.flange.store.mapper;

import com.flange.store.model.UsmAdminRoleRelation;
import com.flange.store.model.UsmAdminRoleRelationExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface UsmAdminRoleRelationMapper {
    int countByExample(UsmAdminRoleRelationExample example);

    int deleteByExample(UsmAdminRoleRelationExample example);

    int deleteByPrimaryKey(String id);

    int insert(UsmAdminRoleRelation record);

    int insertSelective(UsmAdminRoleRelation record);

    List<UsmAdminRoleRelation> selectByExample(UsmAdminRoleRelationExample example);

    UsmAdminRoleRelation selectByPrimaryKey(String id);

    int updateByExampleSelective(@Param("record") UsmAdminRoleRelation record, @Param("example") UsmAdminRoleRelationExample example);

    int updateByExample(@Param("record") UsmAdminRoleRelation record, @Param("example") UsmAdminRoleRelationExample example);

    int updateByPrimaryKeySelective(UsmAdminRoleRelation record);

    int updateByPrimaryKey(UsmAdminRoleRelation record);
}