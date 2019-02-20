package com.flange.store.mapper;

import com.flange.store.model.PmsComment;
import com.flange.store.model.PmsCommentExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface PmsCommentMapper {
    int countByExample(PmsCommentExample example);

    int deleteByExample(PmsCommentExample example);

    int deleteByPrimaryKey(String id);

    int insert(PmsComment record);

    int insertSelective(PmsComment record);

    List<PmsComment> selectByExampleWithBLOBs(PmsCommentExample example);

    List<PmsComment> selectByExample(PmsCommentExample example);

    PmsComment selectByPrimaryKey(String id);

    int updateByExampleSelective(@Param("record") PmsComment record, @Param("example") PmsCommentExample example);

    int updateByExampleWithBLOBs(@Param("record") PmsComment record, @Param("example") PmsCommentExample example);

    int updateByExample(@Param("record") PmsComment record, @Param("example") PmsCommentExample example);

    int updateByPrimaryKeySelective(PmsComment record);

    int updateByPrimaryKeyWithBLOBs(PmsComment record);

    int updateByPrimaryKey(PmsComment record);
}