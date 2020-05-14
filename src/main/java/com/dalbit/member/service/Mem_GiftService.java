package com.dalbit.member.service;

import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.common.vo.PagingVo;
import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.member.dao.Mem_GiftDao;
import com.dalbit.member.vo.procedure.P_MemberChargeInputVo;
import com.dalbit.member.vo.procedure.P_MemberChargeOutputVo;
import com.dalbit.member.vo.procedure.P_MemberGiftInputVo;
import com.dalbit.member.vo.procedure.P_MemberGiftOutputVo;
import com.dalbit.util.DalbitUtil;
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

        pMemberGiftInputVo.setPageNo(pMemberGiftInputVo.getPageNo() -1);
        pMemberGiftInputVo.setPageNo(pMemberGiftInputVo.getPageNo() * pMemberGiftInputVo.getPageCnt());
        ArrayList<P_MemberGiftOutputVo> giftList = null;

        int memberList_totalCnt = 0;
        if(pMemberGiftInputVo.getSlctType() == -1){
            giftList = mem_GiftDao.callGiftHistory_all(pMemberGiftInputVo);
            memberList_totalCnt = mem_GiftDao.callGiftHistory_all_totalCnt(pMemberGiftInputVo);
        }else if(pMemberGiftInputVo.getSlctType() == 0 || pMemberGiftInputVo.getSlctType() == 1){
            giftList = mem_GiftDao.callGiftHistory(pMemberGiftInputVo);
            memberList_totalCnt = mem_GiftDao.callGiftHistory_totalCnt(pMemberGiftInputVo);
        }

        ArrayList<P_MemberGiftOutputVo> allGiftDalCnt = mem_GiftDao.callGiftHistory_allGiftDalCnt(pMemberGiftInputVo);
        ArrayList<P_MemberGiftOutputVo> ReceivedDalCnt = mem_GiftDao.callGiftHistory_allReceivedDalCnt(pMemberGiftInputVo);

        P_MemberGiftOutputVo summary = new P_MemberGiftOutputVo();
        if(!DalbitUtil.isEmpty(allGiftDalCnt)){
            summary.setAllGiftItemCnt(allGiftDalCnt.get(0).getAllGiftItemCnt());
            summary.setAllGiftDalCnt(allGiftDalCnt.get(0).getAllGiftDalCnt());
        }
        if(!DalbitUtil.isEmpty(ReceivedDalCnt)){
            summary.setAllReceivedItemCnt(ReceivedDalCnt.get(0).getAllReceivedItemCnt());
            summary.setAllReceivedDalCnt(ReceivedDalCnt.get(0).getAllReceivedDalCnt());
        }

        String result;
        result = gsonUtil.toJson(new JsonOutputVo(Status.선물내역보기성공, giftList, new PagingVo(memberList_totalCnt),summary));
        return result;
    }



    public String getChargeHistory(P_MemberChargeInputVo pMemberChargeInputVo){

        pMemberChargeInputVo.setPageNo(pMemberChargeInputVo.getPageNo() -1);
        pMemberChargeInputVo.setPageNo(pMemberChargeInputVo.getPageNo() * pMemberChargeInputVo.getPageCnt());
        ArrayList<P_MemberChargeOutputVo> chargeList = null;

        int memberList_totalCnt = 0;
        if(pMemberChargeInputVo.getSlctItem() == -1){
            chargeList = mem_GiftDao.callChargeHistory_all(pMemberChargeInputVo);
            memberList_totalCnt = mem_GiftDao.callChargeHistory_all_totalCnt(pMemberChargeInputVo);
        }else{
            chargeList = mem_GiftDao.callChargeHistory(pMemberChargeInputVo);
            memberList_totalCnt = mem_GiftDao.callChargeHistory_totalCnt(pMemberChargeInputVo);
        }

        P_MemberChargeOutputVo summary = new P_MemberChargeOutputVo();


        int allDalGiftCnt =  mem_GiftDao.callChargeHistory_allDalGiftCnt(pMemberChargeInputVo);
        int allDalReceivedCnt =  mem_GiftDao.callChargeHistory_allDalReceivedCnt(pMemberChargeInputVo);
        int allByeolReceivedCnt =  mem_GiftDao.callChargeHistory_allByeolReceivedCnt(pMemberChargeInputVo);

        summary.setAllDalGiftCnt(allDalGiftCnt);
        summary.setAllDalReceivedCnt(allDalReceivedCnt);
        summary.setAllByeolReceivedCnt(allByeolReceivedCnt);

        String result;
        result = gsonUtil.toJson(new JsonOutputVo(Status.충전선물내역보기_성공, chargeList, new PagingVo(memberList_totalCnt),summary));
        return result;
    }
}
