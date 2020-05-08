package com.dalbit.member.dao;

import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.member.vo.procedure.P_MemberGiftInputVo;
import com.dalbit.member.vo.procedure.P_MemberGiftOutputVo;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;

@Repository
public interface Mem_GiftDao {

//    ArrayList<P_MemberGiftOutputVo> callGiftHistory(ProcedureVo procedureVo);
    @Transactional(readOnly = true)
    ArrayList<P_MemberGiftOutputVo> callGiftHistory_all(P_MemberGiftInputVo pMemberGiftInputVo);

    @Transactional(readOnly = true)
    ArrayList<P_MemberGiftOutputVo> callGiftHistory(P_MemberGiftInputVo pMemberGiftInputVo);

    @Transactional(readOnly = true)
    int callGiftHistory_totalCnt(P_MemberGiftInputVo pMemberGiftInputVo);

}
