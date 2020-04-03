package com.dalbit.member.dao;

import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.member.vo.procedure.P_MemberBroadcastInputVo;
import com.dalbit.member.vo.procedure.P_MemberFanboardInputVo;
import com.dalbit.member.vo.procedure.P_MemberFanboardOutputVo;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

@Repository
public interface Mem_FanboardDao {

//    ArrayList<P_MemberFanboardOutputVo> callFanboardHistory(ProcedureVo procedureVo);

    ArrayList<P_MemberFanboardOutputVo> callFanboardHistory(P_MemberFanboardInputVo pMemberFanboardInputVo);
    int callFanboardHistory_totalCnt(P_MemberFanboardInputVo pMemberFanboardInputVo);
    ArrayList<P_MemberFanboardOutputVo> callFanboardReplyList(P_MemberFanboardInputVo pMemberFanboardInputVo);

}
