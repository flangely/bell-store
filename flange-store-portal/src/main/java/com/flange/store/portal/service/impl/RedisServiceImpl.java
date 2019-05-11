package com.flange.store.portal.service.impl;

import com.flange.store.portal.service.RedisService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Service;

import java.util.concurrent.TimeUnit;

/**
 * @author flangely
 * @create 2019-04-19
 * <p>
 * 5:03 PM
 */
@Service
public class RedisServiceImpl implements RedisService {

    @Autowired
    private StringRedisTemplate stringRedisTemplate;

    @Autowired
    private RedisTemplate<String, Object> redisTemplate;


    @Override
    public void set(String key, String value) {
        stringRedisTemplate.opsForValue().set(key, value);
    }

    @Override
    public void setObj(String objKey, Object key, Object value) {
        redisTemplate.opsForHash().put(objKey, key, value);
    }

    @Override
    public Object getObj(String objKey, Object key) {
       return redisTemplate.opsForHash().get(objKey, key);
    }

    @Override
    public void removeObj(String objKey, Object key) {
        redisTemplate.opsForHash().delete(objKey, key);
    }


    @Override
    public String get(String key) {
       return stringRedisTemplate.opsForValue().get(key);
    }

    @Override
    public boolean expire(String key, long expire) {
        return  stringRedisTemplate.expire(key, expire, TimeUnit.SECONDS);
    }

    @Override
    public void remove(String key) {
        stringRedisTemplate.delete(key);

    }

    @Override
    public Long increment(String key, long delta) {
        return stringRedisTemplate.opsForValue().increment(key, delta);
    }
}
