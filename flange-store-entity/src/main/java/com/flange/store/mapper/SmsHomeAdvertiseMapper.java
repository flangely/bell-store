package com.flange.store.mapper;

import com.flange.store.model.SmsHomeAdvertise;
import com.flange.store.model.SmsHomeAdvertiseExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface SmsHomeAdvertiseMapper {
    int countByExample(SmsHomeAdvertiseExample example);

    int deleteByExample(SmsHomeAdvertiseExample example);

    int deleteByPrimaryKey(String id);

    int insert(SmsHomeAdvertise record);

    int insertSelective(SmsHomeAdvertise record);

    List<SmsHomeAdvertise> selectByExample(SmsHomeAdvertiseExample example);

    SmsHomeAdvertise selectByPrimaryKey(String id);

    int updateByExampleSelective(@Param("record") SmsHomeAdvertise record, @Param("example") SmsHomeAdvertiseExample example);

    int updateByExample(@Param("record") SmsHomeAdvertise record, @Param("example") SmsHomeAdvertiseExample example);

    int updateByPrimaryKeySelective(SmsHomeAdvertise record);

    int updateByPrimaryKey(SmsHomeAdvertise record);
}