package com.dalbit.content.dao;

import com.dalbit.content.vo.BoardAdmStoryVo;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;

@Repository
public interface Con_BoardAdmDao {

    @Transactional(readOnly = true)
    ArrayList<BoardAdmStoryVo> selectStoryList(BoardAdmStoryVo boardAdmStoryVo);

    @Transactional(readOnly = true)
    int selectStoryListCnt(BoardAdmStoryVo boardAdmStoryVo);
}
