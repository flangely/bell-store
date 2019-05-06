package com.flange.store.console.config;

import org.springframework.amqp.core.*;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * 消息队列配置
 * @author flangely
 * @create 2019-04-15
 * <p>
 * 9:43 AM
 */
@Configuration
public class RabbitConfig {

    @Bean
    DirectExchange productDirect(){
        return (DirectExchange)ExchangeBuilder.directExchange("store.product").durable(true).build();
    }


    @Bean
    Queue productQueue() {
        return new Queue("store.product.change");
    }


    @Bean
    Binding productBinding(DirectExchange productDirect,Queue productQueue){
        return BindingBuilder.bind(productQueue).to(productDirect).with("store.product.change");
    }
}
