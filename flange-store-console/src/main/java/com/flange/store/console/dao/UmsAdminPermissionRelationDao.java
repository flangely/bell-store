package com.flange.store.console.dao;

import com.flange.store.model.UmsAdminPermissionRelation;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 用户权限自定义Dao
 *
 */
public interface UmsAdminPermissionRelationDao {
    int insertList(@Param("list") List<UmsAdminPermissionRelation> list);
}
