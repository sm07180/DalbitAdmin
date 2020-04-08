package com.dalbit.member.service;

import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.common.vo.PagingVo;
import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.member.dao.Mem_GiftDao;
import com.dalbit.member.vo.procedure.P_MemberGiftInputVo;
import com.dalbit.member.vo.procedure.P_MemberGiftOutputVo;
import com.dalbit.util.GsonUtil;
import com.google.gson.Gson;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Slf4j
@Service
public class Mem_GiftService {

    @Autowired
    Mem_GiftDao mem_GiftDao;
    @Autowired
    GsonUtil gsonUtil;

    public String getGiftHistory(P_MemberGiftInputVo pMemberGiftInputVo){

//        ProcedureVo procedureVo = new ProcedureVo(pMemberGiftInputVo);
//        ArrayList<P_MemberGiftOutputVo> giftList = mem_GiftDao.callGiftHistory(procedureVo);
//        P_MemberGiftOutputVo summary = new Gson().fromJson(procedureVo.getExt(), P_MemberGiftOutputVo.class);
//
//        String result;
//        if(Integer.parseInt(procedureVo.getRet()) > 0) {
//            result = gsonUtil.toJson(new JsonOutputVo(Status.환전내역보기성공, giftList, new PagingVo(procedureVo.getRet()), summary));
//        }else{
//            result = gsonUtil.toJson(new JsonOutputVo(Status.환전내역보기실패));
//        }
//        return result;

        pMemberGiftInputVo.setPageNo(pMemberGiftInputVo.getPageNo() -1);
        pMemberGiftInputVo.setPageNo(pMemberGiftInputVo.getPageNo() * pMemberGiftInputVo.getPageCnt());

        ArrayList<P_MemberGiftOutputVo> memberList = mem_GiftDao.callGiftHistory(pMemberGiftInputVo);
        int memberList_totalCnt = mem_GiftDao.callGiftHistory_totalCnt(pMemberGiftInputVo);

        String result;
        result = gsonUtil.toJson(new JsonOutputVo(Status.환전내역보기성공, memberList, new PagingVo(memberList_totalCnt)));        return result;
    }
}