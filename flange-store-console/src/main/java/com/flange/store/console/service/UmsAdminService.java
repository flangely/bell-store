package com.flange.store.console.service;

import com.flange.store.console.dto.UmsAdminParam;
import com.flange.store.model.UmsAdmin;
import com.flange.store.model.UmsPermission;
import com.flange.store.model.UmsRole;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

/**
 * 后台管理员Service
 * @author flangely
 * @create 2019-02-24
 * <p>
 * 1:31 AM
 */
public interface UmsAdminService {
    /**
     * 根据用户名获取后台管理员
     */
    UmsAdmin getAdminByUsername(String username);

    /**
     * 注册功能
     */
    UmsAdmin register(UmsAdminParam umsAdminParam);

    /**
     * 登录功能
     *
     * @param username 用户名
     * @param password 密码
     * @return 生成的JWT的token
     */
    String login(String username, String password);

    /**
     * 刷新token的功能
     *
     * @param oldToken 旧的token
     */
    String refreshToken(String oldToken);

    /**
     * 根据用户id获取用户
     */
    UmsAdmin getItem(String id);

    /**
     * 根据用户名或昵称分页查询用户
     */
    List<UmsAdmin> list(String name, Integer pageSize, Integer pageNum);

    /**
     * 修改指定用户信息
     */
    int update(String id, UmsAdmin admin);

    /**
     * 删除指定用户
     */
    int delete(String id);

    /**
     * 修改用户角色关系
     */
    @Transactional
    int updateRole(String adminId, List<String> roleIds);

    /**
     * 获取用户对于角色
     */
    List<UmsRole> getRoleList(String adminId);

    /**
     * 修改用户的+-权限
     */
    @Transactional
    int updatePermission(String adminId, List<String> permissionIds);

    /**
     * 获取用户所有权限（包括角色权限和+-权限）
     */
    List<UmsPermission> getPermissionList(String adminId);

}
