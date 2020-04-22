package com.dalbit.member.dao;

import com.dalbit.content.vo.procedure.P_EventMemberListOutputVo;
import com.dalbit.member.vo.procedure.P_MemberJoinInputVo;
import com.dalbit.member.vo.procedure.P_MemberJoinOutputVo;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.HashMap;

@Repository
public interface Mem_JoinDao {

    ArrayList<P_MemberJoinOutputVo> callJoinList(P_MemberJoinInputVo pMemberJoinInputVo);
    int callJoinList_totalCnt(P_MemberJoinInputVo pMemberJoinInputVo);
    P_MemberJoinOutputVo callJoinList_slctCnt(P_MemberJoinInputVo pMemberJoinInputVo);

    ArrayList<P_MemberJoinOutputVo> callWithdrawalList(P_MemberJoinInputVo pMemberJoinInputVo);
    int callWithdrawalList_totalCnt(P_MemberJoinInputVo pMemberJoinInputVo);
    P_MemberJoinOutputVo callWithdrawalList_slctCnt(P_MemberJoinInputVo pMemberJoinInputVo);

}
