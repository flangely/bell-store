package com.flange.store.console.dto;

import com.flange.store.model.UmsPermission;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

/**
 * Created by flangely on 2018/9/30.
 */
public class UmsPermissionNode extends UmsPermission {
    @Getter
    @Setter
    private List<UmsPermissionNode> children;
}
