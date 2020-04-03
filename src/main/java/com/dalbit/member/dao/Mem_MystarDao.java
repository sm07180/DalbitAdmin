package com.dalbit.member.dao;

import com.dalbit.member.vo.procedure.P_MemberMystarInputVo;
import com.dalbit.member.vo.procedure.P_MemberMystarOutputVo;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

@Repository
public interface Mem_MystarDao {

//    ArrayList<P_MemberMystarOutputVo> callMystarHistory(ProcedureVo procedureVo);

    ArrayList<P_MemberMystarOutputVo> callMystarHistory(P_MemberMystarInputVo pMemberMystarInputVo);
    int callMystarHistory_totalCnt(P_MemberMystarInputVo pMemberMystarInputVo);

    ArrayList<P_MemberMystarOutputVo> callMyfanHistory(P_MemberMystarInputVo pMemberMystarInputVo);
    int callMyfanHistory_totalCnt(P_MemberMystarInputVo pMemberMystarInputVo);

}
