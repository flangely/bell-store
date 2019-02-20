package com.flange.store.mapper;

import com.flange.store.model.CmsSubjectCategory;
import com.flange.store.model.CmsSubjectCategoryExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface CmsSubjectCategoryMapper {
    int countByExample(CmsSubjectCategoryExample example);

    int deleteByExample(CmsSubjectCategoryExample example);

    int deleteByPrimaryKey(String id);

    int insert(CmsSubjectCategory record);

    int insertSelective(CmsSubjectCategory record);

    List<CmsSubjectCategory> selectByExample(CmsSubjectCategoryExample example);

    CmsSubjectCategory selectByPrimaryKey(String id);

    int updateByExampleSelective(@Param("record") CmsSubjectCategory record, @Param("example") CmsSubjectCategoryExample example);

    int updateByExample(@Param("record") CmsSubjectCategory record, @Param("example") CmsSubjectCategoryExample example);

    int updateByPrimaryKeySelective(CmsSubjectCategory record);

    int updateByPrimaryKey(CmsSubjectCategory record);
}