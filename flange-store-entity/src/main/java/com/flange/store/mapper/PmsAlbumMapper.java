package com.flange.store.mapper;

import com.flange.store.model.PmsAlbum;
import com.flange.store.model.PmsAlbumExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface PmsAlbumMapper {
    int countByExample(PmsAlbumExample example);

    int deleteByExample(PmsAlbumExample example);

    int deleteByPrimaryKey(String id);

    int insert(PmsAlbum record);

    int insertSelective(PmsAlbum record);

    List<PmsAlbum> selectByExample(PmsAlbumExample example);

    PmsAlbum selectByPrimaryKey(String id);

    int updateByExampleSelective(@Param("record") PmsAlbum record, @Param("example") PmsAlbumExample example);

    int updateByExample(@Param("record") PmsAlbum record, @Param("example") PmsAlbumExample example);

    int updateByPrimaryKeySelective(PmsAlbum record);

    int updateByPrimaryKey(PmsAlbum record);
}