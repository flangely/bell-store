package com.flange.store.portal.domain;

import lombok.Getter;

/**
 * @author flangely
 * @create 2019-04-19
 * <p> 消息队列枚举配置
 * 3:50 PM
 */
@Getter
public enum QueueEnum {
    /**
     * 消息通知队列
     */
    QUEUE_ORDER_CANCEL("store.order.direct", "store.order.cancel", "store.order.cancel"),
    /**
     * 消息通知ttl队列
     */
    QUEUE_TTL_ORDER_CANCEL("store.order.direct.ttl", "store.order.cancel.ttl", "store.order.cancel.ttl");

    /**
     * 交换名称
     */
    private String exchange;
    /**
     * 队列名称
     */
    private String name;
    /**
     * 路由键
     */
    private String routeKey;

    QueueEnum(String exchange, String name, String routeKey) {
        this.exchange = exchange;
        this.name = name;
        this.routeKey = routeKey;
    }
}
