package com.flange.store.console.util;

import com.flange.store.model.UmsPermission;

import java.util.*;

/**
 * @author flangely
 * @create 2019-03-13
 * <p>
 * 11:25 PM
 */
public class VueMenuTreeUtil {

    public static Map<String,Object> mapArray = new LinkedHashMap<String, Object>();
    public List<UmsPermission> menuCommon;
    public List<Object> list = new ArrayList<Object>();

    public List<Object> menuList(List<UmsPermission> menu){
        this.menuCommon = menu;
        for (UmsPermission permission : menu){
            Map<String, Object> mapArr = new LinkedHashMap<String, Object>();
            if (permission.getType() == 0 && !permission.getUri().equals("/home")){
                String[] urls = permission.getUri().split("/");
                mapArr.put("path", "/" + urls[1]);
                mapArr.put("name", urls[1]);
                mapArr.put("component", "Layout");
                mapArr.put("redirect", permission.getUri());
                Map<String, Object> metaMap = new HashMap<>();
                metaMap.put("title", permission.getName());
                metaMap.put("icon", permission.getIcon());
                mapArr.put("meta", metaMap);
                if (!getChild(permission, menuCommon).isEmpty()){
                    mapArr.put("children", menuChild(permission));
                }
                list.add(mapArr);
            }
        }
        return list;
    }


    public List<Object> menuChild(UmsPermission parent){
        List<Object> lists = new ArrayList<>();
        for (UmsPermission permission : menuCommon){
            Map<String, Object> childArray = new LinkedHashMap<>();
            if (permission.getPid().equals(parent.getId())){
                String[] urls = parent.getUri().split("/");
                childArray.put("path", urls[permission.getType()]);
                childArray.put("name", urls[permission.getType()]);
                childArray.put("component", permission.getUri());
                Map<String, Object> childMetaMap = new HashMap<>();
                childMetaMap.put("title", permission.getName());
                childMetaMap.put("icon", permission.getIcon());
                childArray.put("meta", childMetaMap);
                if (!getChild(permission, menuCommon).isEmpty()){
                    childArray.put("children", menuChild(permission));
                }

                lists.add(childArray);
            }
        }
        return lists;
    }

    public List<UmsPermission> getChild(UmsPermission parent, List<UmsPermission> allPermission){
        List<UmsPermission> children = new ArrayList<>();
        for (UmsPermission permission : allPermission){
            if (permission.getPid().equals(parent.getId())){
                children.add(permission);
            }
        }
        return children;
    }

}
