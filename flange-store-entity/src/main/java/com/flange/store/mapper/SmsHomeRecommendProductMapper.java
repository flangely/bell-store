package com.flange.store.mapper;

import com.flange.store.model.SmsHomeRecommendProduct;
import com.flange.store.model.SmsHomeRecommendProductExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface SmsHomeRecommendProductMapper {
    int countByExample(SmsHomeRecommendProductExample example);

    int deleteByExample(SmsHomeRecommendProductExample example);

    int deleteByPrimaryKey(String id);

    int insert(SmsHomeRecommendProduct record);

    int insertSelective(SmsHomeRecommendProduct record);

    List<SmsHomeRecommendProduct> selectByExample(SmsHomeRecommendProductExample example);

    SmsHomeRecommendProduct selectByPrimaryKey(String id);

    int updateByExampleSelective(@Param("record") SmsHomeRecommendProduct record, @Param("example") SmsHomeRecommendProductExample example);

    int updateByExample(@Param("record") SmsHomeRecommendProduct record, @Param("example") SmsHomeRecommendProductExample example);

    int updateByPrimaryKeySelective(SmsHomeRecommendProduct record);

    int updateByPrimaryKey(SmsHomeRecommendProduct record);
}