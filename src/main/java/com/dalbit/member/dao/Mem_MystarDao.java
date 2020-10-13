package com.dalbit.member.dao;

import com.dalbit.member.vo.procedure.P_MemberMystarInputVo;
import com.dalbit.member.vo.procedure.P_MemberMystarOutputVo;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;

@Repository
public interface Mem_MystarDao {

//    ArrayList<P_MemberMystarOutputVo> callMystarHistory(ProcedureVo procedureVo);

    @Transactional(readOnly = true)
    ArrayList<P_MemberMystarOutputVo> callMystarHistory(P_MemberMystarInputVo pMemberMystarInputVo);

    @Transactional(readOnly = true)
    int callMystarHistory_totalCnt(P_MemberMystarInputVo pMemberMystarInputVo);

    @Transactional(readOnly = true)
    int callMystar_totalCnt(P_MemberMystarInputVo pMemberMystarInputVo);

    @Transactional(readOnly = true)
    ArrayList<P_MemberMystarOutputVo> callMyfanHistory(P_MemberMystarInputVo pMemberMystarInputVo);

    @Transactional(readOnly = true)
    int callMyfanHistory_totalCnt(P_MemberMystarInputVo pMemberMystarInputVo);

    @Transactional(readOnly = true)
    int callMyfan_totalCnt(P_MemberMystarInputVo pMemberMystarInputVo);

}
