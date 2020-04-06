package com.dalbit.member.dao;

import com.dalbit.member.vo.procedure.P_MemberNoticeDeleteVo;
import com.dalbit.member.vo.procedure.P_MemberNoticeInputVo;
import com.dalbit.member.vo.procedure.P_MemberNoticeOutputVo;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

@Repository
public interface Mem_NoticeDao {

//    ArrayList<P_MemberNoticeOutputVo> callNoticeHistory(ProcedureVo procedureVo);

    ArrayList<P_MemberNoticeOutputVo> callNoticeHistory(P_MemberNoticeInputVo pMemberNoticeInputVo);
    int callNoticeHistory_totalCnt(P_MemberNoticeInputVo pMemberNoticeInputVo);
    int callMemberNoticeDelete(P_MemberNoticeDeleteVo pMemberNoticeDeleteVo);
    int callBroadNoticeDelete(P_MemberNoticeDeleteVo pMemberNoticeDeleteVo);

}
