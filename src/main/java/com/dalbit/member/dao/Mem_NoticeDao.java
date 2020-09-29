package com.dalbit.member.dao;

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
    P_MemberNoticeOutputVo selectNoticeSummary(P_MemberNoticeInputVo pMemberNoticeInputVo);

    @Transactional(readOnly = true)
    int callNoticeHistory_totalCnt(P_MemberNoticeInputVo pMemberNoticeInputVo);

    int callMemberNoticeDelete(P_MemberNoticeDeleteVo pMemberNoticeDeleteVo);

    @Transactional(readOnly = true)
    P_MemberNoticeOutputVo callBroadBeforNotice(P_MemberNoticeDeleteVo pMemberNoticeDeleteVo);
    int callBroadNoticeDelete(P_MemberNoticeDeleteVo pMemberNoticeDeleteVo);

}
