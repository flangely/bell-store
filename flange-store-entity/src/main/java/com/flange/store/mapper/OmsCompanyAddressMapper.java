package com.flange.store.mapper;

import com.flange.store.model.OmsCompanyAddress;
import com.flange.store.model.OmsCompanyAddressExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface OmsCompanyAddressMapper {
    int countByExample(OmsCompanyAddressExample example);

    int deleteByExample(OmsCompanyAddressExample example);

    int deleteByPrimaryKey(String id);

    int insert(OmsCompanyAddress record);

    int insertSelective(OmsCompanyAddress record);

    List<OmsCompanyAddress> selectByExample(OmsCompanyAddressExample example);

    OmsCompanyAddress selectByPrimaryKey(String id);

    int updateByExampleSelective(@Param("record") OmsCompanyAddress record, @Param("example") OmsCompanyAddressExample example);

    int updateByExample(@Param("record") OmsCompanyAddress record, @Param("example") OmsCompanyAddressExample example);

    int updateByPrimaryKeySelective(OmsCompanyAddress record);

    int updateByPrimaryKey(OmsCompanyAddress record);
}