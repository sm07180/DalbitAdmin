package com.dalbit.member.dao;

import com.dalbit.content.vo.BoardAdmNoticeReplyDeleteVo;
import com.dalbit.content.vo.BoardAdmNoticeReplyListInputVo;
import com.dalbit.content.vo.BoardAdmNoticeReplyListOutputVo;
import com.dalbit.content.vo.BoardAdmNoticeReplyVo;
import com.dalbit.member.vo.procedure.P_MemberNoticeDeleteVo;
import com.dalbit.member.vo.procedure.P_MemberNoticeInputVo;
import com.dalbit.member.vo.procedure.P_MemberNoticeOutputVo;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;

@Repository
public interface Mem_NoticeDao {

//    ArrayList<P_MemberNoticeOutputVo> callNoticeHistory(ProcedureVo procedureVo);

    @Transactional(readOnly = true)
    ArrayList<P_MemberNoticeOutputVo> callNoticeHistory(P_MemberNoticeInputVo pMemberNoticeInputVo);

    @Transactional(readOnly = true)
    ArrayList<BoardAdmNoticeReplyVo> selectNoticeReply(BoardAdmNoticeReplyVo boardAdmNoticeReplyVo);

    @Transactional(readOnly = true)
    ArrayList<BoardAdmNoticeReplyListOutputVo> selectNoticeReplyList(BoardAdmNoticeReplyListInputVo boardAdmNoticeReplyListInputVo);

    @Transactional(readOnly = true)
    int selectNoticeReplyListCnt(BoardAdmNoticeReplyListInputVo boardAdmNoticeReplyListInputVo);

    int deleteNoticeReplyList(BoardAdmNoticeReplyDeleteVo boardAdmNoticeReplyDeleteVo);

    @Transactional(readOnly = true)
    P_MemberNoticeOutputVo selectNoticeSummary(P_MemberNoticeInputVo pMemberNoticeInputVo);

    @Transactional(readOnly = true)
    BoardAdmNoticeReplyListOutputVo selectNoticeReplyListSummary(BoardAdmNoticeReplyListInputVo boardAdmNoticeReplyListInputVo);

    @Transactional(readOnly = true)
    int callNoticeHistory_totalCnt(P_MemberNoticeInputVo pMemberNoticeInputVo);

    int callMemberNoticeDelete(P_MemberNoticeDeleteVo pMemberNoticeDeleteVo);

    @Transactional(readOnly = true)
    P_MemberNoticeOutputVo callBroadBeforNotice(P_MemberNoticeDeleteVo pMemberNoticeDeleteVo);
    int callBroadNoticeDelete(P_MemberNoticeDeleteVo pMemberNoticeDeleteVo);

}
