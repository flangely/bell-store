package com.flange.store.console.component;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.amqp.core.AmqpTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * 商品信息变化消息发送者
 * @author flangely
 * @create 2019-05-06
 * <p>
 * 10:37 PM
 */
@Component
public class ProductChangeSender {

    private static final Logger LOGGER = LoggerFactory.getLogger(ProductChangeSender.class);

    @Autowired
    private AmqpTemplate amqpTemplate;


    public void sendMessage(String idsAndOper){

        amqpTemplate.convertAndSend("store.product", "store.product.change",idsAndOper);
        LOGGER.info("发送消息成功");
    }

}
