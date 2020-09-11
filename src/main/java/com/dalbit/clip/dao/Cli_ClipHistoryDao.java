package com.dalbit.clip.dao;

import com.dalbit.clip.vo.*;
import com.dalbit.common.vo.ProcedureVo;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;

@Repository
public interface Cli_ClipHistoryDao {

    @Transactional(readOnly = true)
    ArrayList<ClipHistoryVo> selectClipHistoryList(ClipHistoryVo clipHistoryVo);
    @Transactional(readOnly = true)
    int selectClipHistoryListCnt(ClipHistoryVo clipHistoryVo);

    @Transactional(readOnly = true)
    ArrayList<ClipHistoryVo> callClipHistoryList(ProcedureVo procedureVo);

    @Transactional(readOnly = true)
    ArrayList<ClipHistoryMemberVo> callClipHistoryMemberList(ProcedureVo procedureVo);

    int updateHide(ClipHistoryVo clipHistoryVo);

    int deleteClip(ClipHistoryVo clipHistoryVo);

    int insertClipEditHistory(ClipEditHistoryVo clipEditHistoryVo);

    @Transactional(readOnly = true)
    ArrayList<ClipHistoryReplyVo> selectReplyList(ClipHistoryReplyVo clipHistoryReplyVo);

    @Transactional(readOnly = true)
    int selectClipHistoryListenListCnt(ClipHistoryListenVo clipHistoryListenVo);
    @Transactional(readOnly = true)
    ArrayList<ClipHistoryListenVo> selectClipHistoryListenList(ClipHistoryListenVo clipHistoryListenVo);
    @Transactional(readOnly = true)
    ClipHistoryTotalVo selectClipHistoryListenTotalCnt(ClipHistoryListenVo clipHistoryListenVo);

    @Transactional(readOnly = true)
    ArrayList<ClipHistoryListenVo> callClipHistoryListenList(ProcedureVo procedureVo);

    @Transactional(readOnly = true)
    ArrayList<ClipHistoryGiftVo> callClipHistoryGiftList(ProcedureVo procedureVo);

    @Transactional(readOnly = true)
    int selectClipHistoryRemoveListCnt(ClipHistoryRemoveVo clipHistoryRemoveVo);
    @Transactional(readOnly = true)
    ArrayList<ClipHistoryRemoveVo> selectClipHistoryRemoveList(ClipHistoryRemoveVo clipHistoryRemoveVo);

    @Transactional(readOnly = true)
    ArrayList<ClipHistoryRemoveVo> callClipHistoryRemoveList(ProcedureVo procedureVo);



}
