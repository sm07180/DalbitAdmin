package com.dalbit.member.dao;

import com.dalbit.content.vo.procedure.P_EventMemberListOutputVo;
import com.dalbit.member.vo.procedure.P_MemberJoinInputVo;
import com.dalbit.member.vo.procedure.P_MemberJoinOutputVo;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashMap;

@Repository
public interface Mem_JoinDao {

    @Transactional(readOnly = true)
    ArrayList<P_MemberJoinOutputVo> callJoinList(P_MemberJoinInputVo pMemberJoinInputVo);

    @Transactional(readOnly = true)
    int callJoinList_totalCnt(P_MemberJoinInputVo pMemberJoinInputVo);

    @Transactional(readOnly = true)
    P_MemberJoinOutputVo callJoinList_slctCnt(P_MemberJoinInputVo pMemberJoinInputVo);

    @Transactional(readOnly = true)
    ArrayList<P_MemberJoinOutputVo> callWithdrawalList(P_MemberJoinInputVo pMemberJoinInputVo);

    @Transactional(readOnly = true)
    int callWithdrawalList_totalCnt(P_MemberJoinInputVo pMemberJoinInputVo);

    @Transactional(readOnly = true)
    P_MemberJoinOutputVo callWithdrawalList_slctCnt(P_MemberJoinInputVo pMemberJoinInputVo);

}
