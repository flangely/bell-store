package com.flange.store.mapper;

import com.flange.store.model.CmsSubjectComment;
import com.flange.store.model.CmsSubjectCommentExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface CmsSubjectCommentMapper {
    int countByExample(CmsSubjectCommentExample example);

    int deleteByExample(CmsSubjectCommentExample example);

    int deleteByPrimaryKey(String id);

    int insert(CmsSubjectComment record);

    int insertSelective(CmsSubjectComment record);

    List<CmsSubjectComment> selectByExample(CmsSubjectCommentExample example);

    CmsSubjectComment selectByPrimaryKey(String id);

    int updateByExampleSelective(@Param("record") CmsSubjectComment record, @Param("example") CmsSubjectCommentExample example);

    int updateByExample(@Param("record") CmsSubjectComment record, @Param("example") CmsSubjectCommentExample example);

    int updateByPrimaryKeySelective(CmsSubjectComment record);

    int updateByPrimaryKey(CmsSubjectComment record);
}