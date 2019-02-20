package com.flange.store.mapper;

import com.flange.store.model.CmsSubjectProductRelation;
import com.flange.store.model.CmsSubjectProductRelationExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface CmsSubjectProductRelationMapper {
    int countByExample(CmsSubjectProductRelationExample example);

    int deleteByExample(CmsSubjectProductRelationExample example);

    int deleteByPrimaryKey(String id);

    int insert(CmsSubjectProductRelation record);

    int insertSelective(CmsSubjectProductRelation record);

    List<CmsSubjectProductRelation> selectByExample(CmsSubjectProductRelationExample example);

    CmsSubjectProductRelation selectByPrimaryKey(String id);

    int updateByExampleSelective(@Param("record") CmsSubjectProductRelation record, @Param("example") CmsSubjectProductRelationExample example);

    int updateByExample(@Param("record") CmsSubjectProductRelation record, @Param("example") CmsSubjectProductRelationExample example);

    int updateByPrimaryKeySelective(CmsSubjectProductRelation record);

    int updateByPrimaryKey(CmsSubjectProductRelation record);
}