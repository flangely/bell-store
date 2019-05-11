package com.flange.store.console.component;

import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.annotation.Order;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;

/**
 * 首页缓存更新时删除redis缓存
 * @author flangely
 * @create 2019-05-11
 * <p>
 * 9:00 PM
 */

@Aspect
@Component
@Order(3)
public class RedisCacheAspect {

    private static final Logger LOGGER = LoggerFactory.getLogger(RedisCacheAspect.class);

    @Autowired
    private RedisTemplate<String, Object> redisTemplate;


    @Pointcut("(execution(public * com.flange.store.console.controller.PmsProductController.update*(..))) || (execution(public * com.flange.store.console.controller.PmsProductController.creat*(..)))")
    public void updateProductData(){

    }

    @Pointcut("(execution(public * com.flange.store.console.controller.PmsBrandController.update*(..))) || (execution(public * com.flange.store.console.controller.PmsBrandController.creat*(..))) || (execution(public * com.flange.store.console.controller.PmsBrandController.delete*(..)))")
    public void updateBrandData(){

    }

    @Pointcut("(execution(public * com.flange.store.console.controller.SmsHomeNewProductController.update*(..))) || (execution(public * com.flange.store.console.controller.SmsHomeNewProductController.creat*(..))) || (execution(public * com.flange.store.console.controller.SmsHomeNewProductController.delete*(..)))")
    public void updateNewProductData(){

    }

    @Pointcut("(execution(public * com.flange.store.console.controller.SmsHomeAdvertiseController.update*(..))) || (execution(public * com.flange.store.console.controller.SmsHomeAdvertiseController.creat*(..))) || (execution(public * com.flange.store.console.controller.SmsHomeAdvertiseController.delete*(..)))")
    public void updateAdData(){

    }

    @Pointcut("(execution(public * com.flange.store.console.controller.SmsHomeRecommendProductController.update*(..))) || (execution(public * com.flange.store.console.controller.SmsHomeRecommendProductController.creat*(..))) || (execution(public * com.flange.store.console.controller.SmsHomeRecommendProductController.delete*(..)))")
    public void updateRecommendData(){

    }

    @After("updateProductData() || updateBrandData() || updateNewProductData() || updateAdData() || updateRecommendData()")
    public void deleteRedisCache(){
        LOGGER.info("正在删除首页缓存数据...");
        redisTemplate.opsForHash().delete("home", "content");
        LOGGER.info("删除首页缓存数据成功！");

    }


}
