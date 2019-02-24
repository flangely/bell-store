package com.flange.store.console.service.impl;

import com.flange.store.console.dto.UmsAdminParam;
import com.flange.store.console.service.UmsAdminService;
import com.flange.store.model.UmsAdmin;
import com.flange.store.model.UmsAdminExample;
import com.flange.store.model.UmsPermission;
import com.flange.store.model.UmsRole;
import com.flange.store.mapper.UmsAdminMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author flangely
 * @create 2019-02-24
 * <p>
 * 1:43 AM
 */
@Service
public class UmsAdminServiceImpl implements UmsAdminService {

    @Autowired
    private UmsAdminMapper adminMapper;


    @Override
    public UmsAdmin getAdminByUsername(String username) {
        UmsAdminExample example = new UmsAdminExample();
        example.createCriteria().andUsernameEqualTo(username);
        List<UmsAdmin> adminList = adminMapper.selectByExample(example);
        if (adminList != null && adminList.size() > 0){
            return adminList.get(0);
        }
        return null;
    }

    @Override
    public UmsAdmin register(UmsAdminParam umsAdminParam) {
        return null;
    }

    @Override
    public String login(String username, String password) {
        return null;
    }

    @Override
    public String refreshToken(String oldToken) {
        return null;
    }

    @Override
    public UmsAdmin getItem(String id) {
        return null;
    }

    @Override
    public List<UmsAdmin> list(String name, Integer pageSize, Integer pageNum) {
        return null;
    }

    @Override
    public int update(String id, UmsAdmin admin) {
        return 0;
    }

    @Override
    public int delete(String id) {
        return 0;
    }

    @Override
    public int updateRole(String adminId, List<String> roleIds) {
        return 0;
    }

    @Override
    public List<UmsRole> getRoleList(String adminId) {
        return null;
    }

    @Override
    public int updatePermission(String adminId, List<String> permissionIds) {
        return 0;
    }

    @Override
    public List<UmsPermission> getPermissionList(String adminId) {
        return null;
    }
}
