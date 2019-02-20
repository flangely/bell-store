package com.flange.store.mapper;

import com.flange.store.model.PmsAlbumPic;
import com.flange.store.model.PmsAlbumPicExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface PmsAlbumPicMapper {
    int countByExample(PmsAlbumPicExample example);

    int deleteByExample(PmsAlbumPicExample example);

    int deleteByPrimaryKey(String id);

    int insert(PmsAlbumPic record);

    int insertSelective(PmsAlbumPic record);

    List<PmsAlbumPic> selectByExample(PmsAlbumPicExample example);

    PmsAlbumPic selectByPrimaryKey(String id);

    int updateByExampleSelective(@Param("record") PmsAlbumPic record, @Param("example") PmsAlbumPicExample example);

    int updateByExample(@Param("record") PmsAlbumPic record, @Param("example") PmsAlbumPicExample example);

    int updateByPrimaryKeySelective(PmsAlbumPic record);

    int updateByPrimaryKey(PmsAlbumPic record);
}