package com.flange.store.util;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @author flangely
 * @create 2019-03-20
 * <p>主键自增长工具类
 * 12:14 AM
 */
public class IdUtil {


//    public static void main (String[] args){
//       String s = getOrderId();
//       System.out.println(s);
//    }d
    /**
     * 生成主键id
     * @return
     */
    public static String getGeneralID(){
       return System.currentTimeMillis() + "" + (int)((Math.random()*9+1)*1000000);
    }
    /**
     * 生成订单Id
     */
    public static String getOrderId(){
        Date now = new Date();
        SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");
        return format.format(now) + (int)((Math.random()*9+1)*100000);
    }

    public static List<Long> strsToLongs(List<String> stringList){
        List<Long> ids = new ArrayList<>();
        for (String id : stringList){
            ids.add(Long.parseLong(id));
        }
        return ids;
    }

}
