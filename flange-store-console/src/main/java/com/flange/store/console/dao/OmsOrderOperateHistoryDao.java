package com.flange.store.console.dao;

import com.flange.store.model.OmsOrderOperateHistory;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author flangely
 * @create 2019-03-17
 * <p>订单操作记录自定义查询DAO
 * 9:57 AM
 */
public interface OmsOrderOperateHistoryDao {
    int insertList(@Param("list") List<OmsOrderOperateHistory> orderOperateHistoryList);
}
