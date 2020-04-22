package com.dalbit.member.service;

import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.common.vo.PagingVo;
import com.dalbit.member.dao.Mem_JoinDao;
import com.dalbit.member.vo.procedure.P_MemberJoinInputVo;
import com.dalbit.member.vo.procedure.P_MemberJoinOutputVo;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Slf4j
@Service
public class Mem_JoinService {

    @Autowired
    Mem_JoinDao mem_JoinDao;
    @Autowired
    GsonUtil gsonUtil;

    public String getJoinList(P_MemberJoinInputVo pMemberJoinInputVo){
        pMemberJoinInputVo.setPageNo(pMemberJoinInputVo.getPageNo() -1);
        pMemberJoinInputVo.setPageNo(pMemberJoinInputVo.getPageNo() * pMemberJoinInputVo.getPageCnt());
        ArrayList<P_MemberJoinOutputVo> joinList = mem_JoinDao.callJoinList(pMemberJoinInputVo);
        int totalCnt = mem_JoinDao.callJoinList_totalCnt(pMemberJoinInputVo);
        P_MemberJoinOutputVo slctCnt_List = mem_JoinDao.callJoinList_slctCnt(pMemberJoinInputVo);

        String result;
        result = gsonUtil.toJson(new JsonOutputVo(Status.회원가입조회_성공, joinList, new PagingVo(totalCnt),slctCnt_List));

        log.info(result);

        return result;
    }

    public String getWithdrawalList(P_MemberJoinInputVo pMemberJoinInputVo){
        pMemberJoinInputVo.setPageNo(pMemberJoinInputVo.getPageNo() -1);
        pMemberJoinInputVo.setPageNo(pMemberJoinInputVo.getPageNo() * pMemberJoinInputVo.getPageCnt());
        ArrayList<P_MemberJoinOutputVo> withdrawalList = mem_JoinDao.callWithdrawalList(pMemberJoinInputVo);
        int totalCnt = mem_JoinDao.callWithdrawalList_totalCnt(pMemberJoinInputVo);
        P_MemberJoinOutputVo slctCnt_List = mem_JoinDao.callWithdrawalList_slctCnt(pMemberJoinInputVo);

        String result;
        result = gsonUtil.toJson(new JsonOutputVo(Status.회원가입조회_성공, withdrawalList, new PagingVo(totalCnt),slctCnt_List));

        log.info(result);

        return result;
    }

}
