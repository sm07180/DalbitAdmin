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

/** ==----------------------------------------- 충전 아이템 ------------------------------------------------------------------*/

    /** 충전 아이템 리스트 */
    public String callContentsChargeItemList(P_itemChargeListInputVo pItemChargeListInputVo) {
        ProcedureVo procedureVo = new ProcedureVo(pItemChargeListInputVo);

        ArrayList<P_itemChargeListOutputVo> chargeList = itemDao.callContentsChargeItemList(procedureVo);
        P_itemChargeListOutputVo summary = new Gson().fromJson(procedureVo.getExt(), P_itemChargeListOutputVo.class);

        String result;

        if(Integer.parseInt(procedureVo.getRet()) > 0) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.충전아이템조회_성공, chargeList, new PagingVo(procedureVo.getRet()), summary));
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



/** ==----------------------------------------- 교환 아이템 ------------------------------------------------------------------*/

    /** 교환 아이템 리스트 */
    public String callContentsExchangeItemList(P_itemExchangeListInputVo pItemExchangeListInputVo) {
        ProcedureVo procedureVo = new ProcedureVo(pItemExchangeListInputVo);

        ArrayList<P_itemExchangeListOutputVo> exchangeList = itemDao.callContentsExchangeItemList(procedureVo);
        P_itemExchangeListOutputVo summary = new Gson().fromJson(procedureVo.getExt(), P_itemExchangeListOutputVo.class);

        String result;

        if(Integer.parseInt(procedureVo.getRet()) > 0) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.교환아이템조회_성공, exchangeList, new PagingVo(procedureVo.getRet()), summary));
        }else if(Status.교환아이템조회_데이터없음.getMessageCode().equals(procedureVo.getRet())){
            result = gsonUtil.toJson(new JsonOutputVo(Status.교환아이템조회_데이터없음));
        }else{
            result = gsonUtil.toJson(new JsonOutputVo(Status.교환아이템조회_에러));
        }

        return result;
    }

    /** 교환 아이템 상세 */
    public String callContentsExchangeItemDetail(P_itemExchangeDetailInputVo pItemExchangeDetailInputVo) {
        ProcedureVo procedureVo = new ProcedureVo(pItemExchangeDetailInputVo);

        itemDao.callContentsExchangeItemDetail(procedureVo);
        P_itemExchangeDetailOutputVo exchangeDetail = new Gson().fromJson(procedureVo.getExt(), P_itemExchangeDetailOutputVo.class);

        String result;

        if(Status.교환아이템상세조회_성공.getMessageCode().equals(procedureVo.getRet())) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.교환아이템상세조회_성공, exchangeDetail));
        } else if(Status.교환아이템상세조회_상품코드없음.getMessageCode().equals(procedureVo.getRet())) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.교환아이템상세조회_상품코드없음));
        } else {
            result = gsonUtil.toJson(new JsonOutputVo(Status.교환아이템상세조회_에러));
        }

        return result;
    }

    /**
     * 교환 아이템 등록
     */
    public String callContentsExchangeItemAdd(P_itemExchangeInsertVo pItemExchangeInsertVo){
        pItemExchangeInsertVo.setOpName(MemberVo.getMyMemNo());

        ProcedureVo procedureVo = new ProcedureVo(pItemExchangeInsertVo, true);

        itemDao.callContentsExchangeItemAdd(procedureVo);

        String result;
        if(Status.교환아이템등록_성공.getMessageCode().equals(procedureVo.getRet())){
            result = gsonUtil.toJson(new JsonOutputVo(Status.교환아이템등록_성공));
        }else if(Status.교환아이템등록_플랫폼미선택.getMessageCode().equals(procedureVo.getRet())) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.교환아이템등록_플랫폼미선택));
        }else if(Status.교환아이템등록_IOS미지원.getMessageCode().equals(procedureVo.getRet())) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.교환아이템등록_IOS미지원));
        }else {
            result = gsonUtil.toJson(new JsonOutputVo(Status.교환아이템등록_실패));
        }

        return result;
    }

    /**
     * 교환 아이템 수정
     */
    public String callContentsExchangeItemEdit(P_itemExchangeUpdateVo pItemExchangeUpdateVo) {
        pItemExchangeUpdateVo.setOpName(MemberVo.getMyMemNo());
        ProcedureVo procedureVo = new ProcedureVo(pItemExchangeUpdateVo, true);

        itemDao.callContentsExchangeItemEdit(procedureVo);
        String result;
        if(Status.교환아이템수정_성공.getMessageCode().equals(procedureVo.getRet())){
            result = gsonUtil.toJson(new JsonOutputVo(Status.교환아이템수정_성공));
        } else if(Status.교환아이템수정_아이템코드없음.getMessageCode().equals(procedureVo.getRet())){
            result = gsonUtil.toJson(new JsonOutputVo(Status.교환아이템수정_아이템코드없음));
        }else if(Status.교환아이템수정_플랫폼미선택.getMessageCode().equals(procedureVo.getRet())) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.교환아이템수정_플랫폼미선택));
        }else if(Status.교환아이템수정_IOS미지원.getMessageCode().equals(procedureVo.getRet())) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.교환아이템수정_IOS미지원));
        } else {
            result = gsonUtil.toJson(new JsonOutputVo(Status.교환아이템수정_에러));
        }

        return result;
    }

    /**
     * 교환 아이템 삭제
     */
    public String callContentsExchangeItemDelete(P_itemExchangeDeleteVo pItemExchangeDeleteVo) {
        pItemExchangeDeleteVo.setOpName(MemberVo.getMyMemNo());

        int sucCnt=0;
        int failCnt=0;

        String result="";

        String[] idxs = pItemExchangeDeleteVo.getItem_code().split(",");
        for(int i=0; i < idxs.length; i++) {
            ProcedureVo procedureVo = new ProcedureVo(new P_itemExchangeDeleteVo(idxs[i]));

            itemDao.callContentsExchangeItemDelete(procedureVo);

            if (Status.교환아이템삭제_성공.getMessageCode().equals(procedureVo.getRet())) {
                sucCnt++;
            } else {
                failCnt++;
            }
        }

        HashMap resultMap = new HashMap();
        resultMap.put("sucCnt", sucCnt);
        resultMap.put("failCnt", failCnt);

        if(0 < sucCnt){
            result = gsonUtil.toJson(new JsonOutputVo(Status.교환아이템삭제_성공, resultMap));
        }else{
            result = gsonUtil.toJson(new JsonOutputVo(Status.교환아이템삭제_실패, resultMap));
        }

        return result;
    }





/** ==----------------------------------------- 선물 아이템 ------------------------------------------------------------------*/

    /** 선물 아이템 리스트 */
    public String callContentsGiftItemList(P_itemGiftListInputVo pItemGiftListInputVo) {
        ProcedureVo procedureVo = new ProcedureVo(pItemGiftListInputVo);

        ArrayList<P_itemGiftListOutputVo> giftList = itemDao.callContentsGiftItemList(procedureVo);
        P_itemGiftListOutputVo summary = new Gson().fromJson(procedureVo.getExt(), P_itemGiftListOutputVo.class);

        String result;

        if(Integer.parseInt(procedureVo.getRet()) > 0) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.선물아이템조회_성공, giftList, new PagingVo(procedureVo.getRet()), summary));
        }else if(Status.선물아이템조회_데이터없음.getMessageCode().equals(procedureVo.getRet())){
            result = gsonUtil.toJson(new JsonOutputVo(Status.선물아이템조회_데이터없음));
        }else{
            result = gsonUtil.toJson(new JsonOutputVo(Status.선물아이템조회_에러));
        }

        return result;
    }

    /** 선물 아이템 상세 */
    public String callContentsGiftItemDetail(P_itemGiftDetailInputVo pItemGiftDetailInputVo) {
        ProcedureVo procedureVo = new ProcedureVo(pItemGiftDetailInputVo);

        itemDao.callContentsGiftItemDetail(procedureVo);
        P_itemGiftDetailOutputVo giftDetail = new Gson().fromJson(procedureVo.getExt(), P_itemGiftDetailOutputVo.class);

        String result;

        if(Status.선물아이템상세조회_성공.getMessageCode().equals(procedureVo.getRet())) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.선물아이템상세조회_성공, giftDetail));
        } else if(Status.선물아이템상세조회_상품코드없음.getMessageCode().equals(procedureVo.getRet())) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.선물아이템상세조회_상품코드없음));
        } else {
            result = gsonUtil.toJson(new JsonOutputVo(Status.선물아이템상세조회_에러));
        }

        return result;
    }

    /**
     * 선물 아이템 등록
     */
    public String callContentsGiftItemAdd(P_itemGiftInsertVo pItemGiftInsertVo){
        pItemGiftInsertVo.setOpName(MemberVo.getMyMemNo());

        ProcedureVo procedureVo = new ProcedureVo(pItemGiftInsertVo, true);

        itemDao.callContentsGiftItemAdd(procedureVo);

        String result;
        if(Status.선물아이템등록_성공.getMessageCode().equals(procedureVo.getRet())){
            result = gsonUtil.toJson(new JsonOutputVo(Status.선물아이템등록_성공));
        } else if(Status.선물아이템등록_플랫폼미선택.getMessageCode().equals(procedureVo.getRet())){
            result = gsonUtil.toJson(new JsonOutputVo(Status.선물아이템등록_플랫폼미선택));
        } else if(Status.선물아이템등록_아이템구분미선택.getMessageCode().equals(procedureVo.getRet())){
            result = gsonUtil.toJson(new JsonOutputVo(Status.선물아이템등록_아이템구분미선택));
        } else if(Status.선물아이템등록_아이템가격미입력.getMessageCode().equals(procedureVo.getRet())){
            result = gsonUtil.toJson(new JsonOutputVo(Status.선물아이템등록_아이템가격미입력));
        } else if(Status.선물아이템등록_지급별수량미입력.getMessageCode().equals(procedureVo.getRet())){
            result = gsonUtil.toJson(new JsonOutputVo(Status.선물아이템등록_지급별수량미입력));
        } else{
            result = gsonUtil.toJson(new JsonOutputVo(Status.선물아이템등록_실패));
        }

        return result;
    }

    /**
     * 선물 아이템 수정
     */
    public String callContentsGiftItemEdit(P_itemGiftUpdateVo pItemGiftUpdateVo) {
        pItemGiftUpdateVo.setOpName(MemberVo.getMyMemNo());
        ProcedureVo procedureVo = new ProcedureVo(pItemGiftUpdateVo, true);

        itemDao.callContentsGiftItemEdit(procedureVo);
        String result;
        if(Status.선물아이템수정_성공.getMessageCode().equals(procedureVo.getRet())){
            result = gsonUtil.toJson(new JsonOutputVo(Status.선물아이템수정_성공));
        } else if(Status.선물아이템수정_아이템코드미입력.getMessageCode().equals(procedureVo.getRet())){
            result = gsonUtil.toJson(new JsonOutputVo(Status.선물아이템수정_아이템코드미입력));
        } else if(Status.선물아이템수정_플랫폼미선택.getMessageCode().equals(procedureVo.getRet())){
            result = gsonUtil.toJson(new JsonOutputVo(Status.선물아이템수정_플랫폼미선택));
        } else if(Status.선물아이템수정_아이템구분미선택.getMessageCode().equals(procedureVo.getRet())){
            result = gsonUtil.toJson(new JsonOutputVo(Status.선물아이템수정_아이템구분미선택));
        } else if(Status.선물아이템수정_아이템가격미입력.getMessageCode().equals(procedureVo.getRet())){
            result = gsonUtil.toJson(new JsonOutputVo(Status.선물아이템수정_아이템가격미입력));
        } else if(Status.선물아이템수정_지급별수량미입력.getMessageCode().equals(procedureVo.getRet())){
            result = gsonUtil.toJson(new JsonOutputVo(Status.선물아이템수정_지급별수량미입력));
        } else {
            result = gsonUtil.toJson(new JsonOutputVo(Status.선물아이템수정_에러));
        }

        return result;
    }

    /**
     * 선물 아이템 삭제
     */
    public String callContentsGiftItemDelete(P_itemGiftDeleteVo pItemGiftDeleteVo) {
        pItemGiftDeleteVo.setOpName(MemberVo.getMyMemNo());

        int sucCnt=0;
        int failCnt=0;

        String result="";

        String[] idxs = pItemGiftDeleteVo.getItem_code().split(",");
        for(int i=0; i < idxs.length; i++) {
            ProcedureVo procedureVo = new ProcedureVo(new P_itemGiftDeleteVo(idxs[i]));

            itemDao.callContentsGiftItemDelete(procedureVo);

            if (Status.선물아이템삭제_성공.getMessageCode().equals(procedureVo.getRet())) {
                sucCnt++;
            } else {
                failCnt++;
            }
        }

        HashMap resultMap = new HashMap();
        resultMap.put("sucCnt", sucCnt);
        resultMap.put("failCnt", failCnt);

        if(0 < sucCnt){
            result = gsonUtil.toJson(new JsonOutputVo(Status.선물아이템삭제_성공, resultMap));
        }else{
            result = gsonUtil.toJson(new JsonOutputVo(Status.선물아이템삭제_실패, resultMap));
        }

        return result;
    }



    /** 퀵 메시지 목록 */
    public String getQuickList() {
        ArrayList<P_QuickListOutputVo> list = itemDao.getQuickList();

        String result;
        result = gsonUtil.toJson(new JsonOutputVo(Status.조회, list, new PagingVo(0)));

        return result;
    }

}


