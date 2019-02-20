package com.flange.store.mapper;

import com.flange.store.model.CmsSubject;
import com.flange.store.model.CmsSubjectExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface CmsSubjectMapper {
    int countByExample(CmsSubjectExample example);

    int deleteByExample(CmsSubjectExample example);

    int deleteByPrimaryKey(String id);

    int insert(CmsSubject record);

    int insertSelective(CmsSubject record);

    List<CmsSubject> selectByExampleWithBLOBs(CmsSubjectExample example);

    List<CmsSubject> selectByExample(CmsSubjectExample example);

    CmsSubject selectByPrimaryKey(String id);

    int updateByExampleSelective(@Param("record") CmsSubject record, @Param("example") CmsSubjectExample example);

    int updateByExampleWithBLOBs(@Param("record") CmsSubject record, @Param("example") CmsSubjectExample example);

    int updateByExample(@Param("record") CmsSubject record, @Param("example") CmsSubjectExample example);

    int updateByPrimaryKeySelective(CmsSubject record);

    int updateByPrimaryKeyWithBLOBs(CmsSubject record);

    int updateByPrimaryKey(CmsSubject record);
}