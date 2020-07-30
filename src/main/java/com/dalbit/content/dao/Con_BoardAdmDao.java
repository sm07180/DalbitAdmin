package com.dalbit.content.dao;

import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.content.vo.BoardAdmFanBoardDeleteVo;
import com.dalbit.content.vo.BoardAdmFanBoardReplyVo;
import com.dalbit.content.vo.BoardAdmFanBoardVo;
import com.dalbit.content.vo.BoardAdmStoryVo;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;

@Repository
public interface Con_BoardAdmDao {

    @Transactional(readOnly = true)
    ArrayList<BoardAdmFanBoardVo> selectFanBoardList(BoardAdmFanBoardVo boardAdmFanBoardVo);

    int deleteFanBoard(BoardAdmFanBoardDeleteVo boardAdmFanBoardDeleteVo);

    @Transactional(readOnly = true)
    ArrayList<BoardAdmFanBoardReplyVo> selectReply(BoardAdmFanBoardReplyVo boardAdmFanBoardReplyVo);

    @Transactional(readOnly = true)
    int selectFanBoardListCnt(BoardAdmFanBoardVo boardAdmFanBoardVo);

    @Transactional(readOnly = true)
    ArrayList<BoardAdmStoryVo> selectStoryList(BoardAdmStoryVo boardAdmStoryVo);

    @Transactional(readOnly = true)
    int selectStoryListCnt(BoardAdmStoryVo boardAdmStoryVo);

    ProcedureVo callStoryDelete(ProcedureVo procedureVo);



}
