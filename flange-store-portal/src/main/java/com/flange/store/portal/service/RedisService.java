package com.flange.store.portal.service;

import com.flange.store.portal.domain.HomeContentResult;

/**
 * @author flangely
 * @create 2019-04-19
 * <p>  redis操作Service,对象和数组都以json形式进行存储
 * 5:01 PM
 */
public interface RedisService {
    /**
     * 存储数据
     */
    void set(String key, String value);

    void setObj(String objKey, Object key, Object value);

    Object getObj(String objKey, Object key);

    void removeObj(String objKey, Object key);

    /**
     * 获取数据
     */
    String get(String key);

    /**
     * 设置超期时间
     */
    boolean expire(String key, long expire);

    /**
     * 删除数据
     */
    void remove(String key);

    /**
     * 自增操作
     * @param delta 自增步长
     */
    Long increment(String key, long delta);

}
