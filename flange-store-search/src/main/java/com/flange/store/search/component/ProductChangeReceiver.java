package com.flange.store.search.component;

import com.flange.store.search.service.EsProductService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.amqp.rabbit.annotation.RabbitHandler;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Arrays;
import java.util.List;

/**
 * @author flangely
 * @create 2019-05-06
 * <p>
 * 10:45 PM
 */
@Component
@RabbitListener(queues = "store.product.change")
public class ProductChangeReceiver {

    private static final Logger LOGGER = LoggerFactory.getLogger(ProductChangeReceiver.class);

    @Autowired
    private EsProductService esProductService;

    @RabbitHandler
    public void handle(String idAndOper){
        String[] msg = idAndOper.split(",");
        if (msg.length > 2){
            String[] idArray = Arrays.copyOfRange(msg, 0, msg.length - 1);
            List<String> ids = Arrays.asList(idArray);
            String operate = msg[msg.length - 1];
            if (operate.equals("delete")){
                esProductService.delete(ids);
            }else {
                esProductService.importAll();
            }
        }
        if (msg.length == 2){
            String id = msg[0];
            String operate = msg[1];
            if (operate.equals("add")) {
                esProductService.create(id);
            }
            if (operate.equals("edit")){
                esProductService.create(id);
            }
            if (operate.equals("delete")){
                esProductService.delete(id);
            }


        }
        if (msg.length == 1){
            esProductService.importAll();
        }
        LOGGER.info("更新索引成功");
    }


}
