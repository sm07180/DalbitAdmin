package com.dalbit.clip.dao;

import com.dalbit.clip.vo.*;
import com.dalbit.clip.vo.procedure.P_ClipHistoryDetailInfoEditHistoryVo;
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
    ClipHistoryTotalVo selectReplySummary(ClipHistoryReplyVo clipHistoryReplyVo);

    @Transactional(readOnly = true)
    int selectClipHistoryListenListCnt(ClipHistoryListenVo clipHistoryListenVo);
    @Transactional(readOnly = true)
    ArrayList<ClipHistoryListenVo> selectClipHistoryListenList(ClipHistoryListenVo clipHistoryListenVo);
    @Transactional(readOnly = true)
    ClipHistoryListenTotalVo selectClipHistoryListenTotalCnt(ClipHistoryListenVo clipHistoryListenVo);

    @Transactional(readOnly = true)
    int callClipHistoryGoodListCnt(ClipHistoryListenVo clipHistoryListenVo);
    @Transactional(readOnly = true)
    ArrayList<ClipHistoryListenVo> callClipHistoryGoodList(ClipHistoryListenVo clipHistoryListenVo);
    @Transactional(readOnly = true)
    ClipHistoryTotalVo callClipHistoryGoodTotal(ClipHistoryListenVo clipHistoryListenVo);

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

    @Transactional(readOnly = true)
    ProcedureVo callAdminClipInfoDetail(ProcedureVo procedureVo);

    int callAdminClipInfoDetailEdit(ProcedureVo procedureVo);

    @Transactional(readOnly = true)
    ArrayList<P_ClipHistoryDetailInfoEditHistoryVo> callAdminClipEditHistory(ProcedureVo procedureVo);

    int deleteClipReply(ClipHistoryReplyVo clipHistoryReplyVo);
}