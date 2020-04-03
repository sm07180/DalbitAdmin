package com.dalbit.content.service;

import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.common.vo.PagingVo;
import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.content.dao.ItemDao;
import com.dalbit.content.vo.procedure.*;
import com.dalbit.member.vo.MemberVo;
import com.dalbit.util.GsonUtil;
import com.google.gson.Gson;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;

@Slf4j
@Service
public class ItemService {

    @Autowired
    ItemDao itemDao;

    @Autowired
    GsonUtil gsonUtil;

    public String callServiceCenterItemGiftList(P_itemGiftListInputVo pItemGiftListInputVo) {
        ProcedureVo procedureVo = new ProcedureVo(pItemGiftListInputVo);

        ArrayList<P_itemGiftListOutputVo> noticeList = itemDao.callServiceCenterItemGiftList(procedureVo);

        String result;

        if(Integer.parseInt(procedureVo.getRet()) > 0) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.선물아이템조회_성공, noticeList, new PagingVo(procedureVo.getRet())));
        }else if(Status.선물아이템조회_데이터없음.getMessageCode().equals(procedureVo.getRet())){
            result = gsonUtil.toJson(new JsonOutputVo(Status.선물아이템조회_데이터없음));
        }else{
            result = gsonUtil.toJson(new JsonOutputVo(Status.선물아이템조회_에러));
        }

        return result;
    }

    /** 충전 아이템 리스트 */
    public String callContentsChargeItemList(P_itemChargeListInputVo pItemChargeListInputVo) {
        ProcedureVo procedureVo = new ProcedureVo(pItemChargeListInputVo);

        ArrayList<P_itemChargeListOutputVo> chargeList = itemDao.callContentsChargeItemList(procedureVo);

        String result;

        if(Integer.parseInt(procedureVo.getRet()) > 0) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.충전아이템조회_성공, chargeList, new PagingVo(procedureVo.getRet())));
        }else if(Status.충전아이템조회_데이터없음.getMessageCode().equals(procedureVo.getRet())){
            result = gsonUtil.toJson(new JsonOutputVo(Status.충전아이템조회_데이터없음));
        }else{
            result = gsonUtil.toJson(new JsonOutputVo(Status.충전아이템조회_에러));
        }

        return result;
    }

    /** 충전 아이템 상세 */
    public String callContentsChargeItemDetail(P_itemChargeDetailInputVo pItemChargeDetailInputVo) {
        ProcedureVo procedureVo = new ProcedureVo(pItemChargeDetailInputVo);

        itemDao.callContentsChargeItemDetail(procedureVo);
        P_itemChargeDetailOutputVo chargeDetail = new Gson().fromJson(procedureVo.getExt(), P_itemChargeDetailOutputVo.class);

        String result;

         if(Status.충전아이템상세조회_성공.getMessageCode().equals(procedureVo.getRet())) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.충전아이템상세조회_성공, chargeDetail));
        } else if(Status.충전아이템상세조회_상품코드없음.getMessageCode().equals(procedureVo.getRet())) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.충전아이템상세조회_상품코드없음));
        } else {
            result = gsonUtil.toJson(new JsonOutputVo(Status.충전아이템상세조회_에러));
        }

        return result;
    }

    /**
     * 충전 아이템 등록
     */
    public String callContentsChargeItemAdd(P_itemChargeInsertVo pItemChargeInsertVo){
        pItemChargeInsertVo.setOpName(MemberVo.getMyMemNo());

        ProcedureVo procedureVo = new ProcedureVo(pItemChargeInsertVo, true);

        itemDao.callContentsChargeItemAdd(procedureVo);

        String result;
        if(Status.충전아이템등록_성공.getMessageCode().equals(procedureVo.getRet())){
            result = gsonUtil.toJson(new JsonOutputVo(Status.충전아이템등록_성공));
        } else {
            result = gsonUtil.toJson(new JsonOutputVo(Status.충전아이템등록_실패));
        }

        return result;
    }

    /**
     * 충전 아이템 수정
     */
    public String callContentsChargeItemEdit(P_itemChargeUpdateVo pItemChargeUpdateVo) {
        pItemChargeUpdateVo.setOpName(MemberVo.getMyMemNo());
        ProcedureVo procedureVo = new ProcedureVo(pItemChargeUpdateVo, true);

        itemDao.callContentsChargeItemEdit(procedureVo);
        String result;
        if(Status.충전아이템수정_성공.getMessageCode().equals(procedureVo.getRet())){
            result = gsonUtil.toJson(new JsonOutputVo(Status.충전아이템수정_성공));
        } else if(Status.충전아이템수정_실패.getMessageCode().equals(procedureVo.getRet())){
            result = gsonUtil.toJson(new JsonOutputVo(Status.충전아이템수정_실패));
        } else {
            result = gsonUtil.toJson(new JsonOutputVo(Status.충전아이템수정_에러));
        }

        return result;
    }

    /**
     * 충전 아이템 삭제
     */
    public String callContentsChargeItemDelete(P_itemChargeDeleteVo pItemChargeDeleteVo) {
        pItemChargeDeleteVo.setOpName(MemberVo.getMyMemNo());

        int sucCnt=0;
        int failCnt=0;

        String result="";

        String[] idxs = pItemChargeDeleteVo.getItem_code().split(",");
        for(int i=0; i < idxs.length; i++) {
            ProcedureVo procedureVo = new ProcedureVo(new P_itemChargeDeleteVo(idxs[i]));

            itemDao.callContentsChargeItemDelete(procedureVo);

            if (Status.충전아이템삭제_성공.getMessageCode().equals(procedureVo.getRet())) {
                sucCnt++;
            } else {
                failCnt++;
            }
        }

        HashMap resultMap = new HashMap();
        resultMap.put("sucCnt", sucCnt);
        resultMap.put("failCnt", failCnt);

        if(0 < sucCnt){
            result = gsonUtil.toJson(new JsonOutputVo(Status.충전아이템삭제_성공, resultMap));
        }else{
            result = gsonUtil.toJson(new JsonOutputVo(Status.충전아이템삭제_실패, resultMap));
        }

        return result;
    }

}
