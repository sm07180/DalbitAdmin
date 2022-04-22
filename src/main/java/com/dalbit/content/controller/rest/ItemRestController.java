package com.dalbit.content.controller.rest;

import com.dalbit.common.code.ErrorStatus;
import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.common.vo.PagingVo;
import com.dalbit.content.service.ItemService;
import com.dalbit.content.vo.GiftOrder;
import com.dalbit.content.vo.ItemVo;
import com.dalbit.content.vo.MemSelSignatureGiftParamVo;
import com.dalbit.content.vo.procedure.*;
import com.dalbit.socket.service.SocketService;
import com.dalbit.util.DalbitUtil;
import com.dalbit.util.GsonUtil;
import com.dalbit.util.JwtUtil;
import com.dalbit.util.SocketUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Slf4j
@RestController
@RequestMapping("rest/content/item")
public class ItemRestController {

    @Autowired
    ItemService itemService;

    @Autowired
    SocketUtil socketUtil;
    @Autowired
    SocketService socketService;
    @Autowired
    JwtUtil jwtUtil;

    @Autowired
    GsonUtil gsonUtil;

/** ==----------------------------------------- 충전 아이템 ------------------------------------------------------------------*/
    /**
     * 충전 아이템
     */
    @PostMapping("charge/list")
    public String chargeList(P_itemChargeListInputVo pItemChargeListInputVo) {
        String result = itemService.callContentsChargeItemList(pItemChargeListInputVo);
        return result;
    }

    /**
     * 시그니처 아이템 조회하기
     */
    @PostMapping("signatureGift/list")
    public String signatureList(P_itemGiftListInputVo pItemGiftListInputVo) {
        return itemService.getSignatureList(pItemGiftListInputVo);
    }

    /**
     * 시그니처 아이템 (특정유저 memNo 조건의 아이템 리스트)
     */
    @PostMapping("member/signatureGift/list")
    public String memSelSignatureList(@Valid MemSelSignatureGiftParamVo paramVo) {
        return itemService.getMemSelSignatureList(paramVo);
    }

    /**
     * 충전 아이템 상세
     */
    @PostMapping("charge/detail")
    public String chargeDetail(P_itemChargeDetailInputVo pItemChargeDetailInputVo) {
        String result = itemService.callContentsChargeItemDetail(pItemChargeDetailInputVo);
        return result;
    }

    /**
     * 충전 아이템 등록
     */
    @PostMapping("charge/insert")
    public String chargeInsert(P_itemChargeInsertVo pItemChargeInsertVo) {
        String result = itemService.callContentsChargeItemAdd(pItemChargeInsertVo);
        return result;
    }

    /**
     * 충전 아이템 수정
     */
    @PostMapping("charge/update")
    public String chargeUpdate(P_itemChargeUpdateVo pItemChargeUpdateVo) {
        String result = itemService.callContentsChargeItemEdit(pItemChargeUpdateVo);
        return result;
    }

    /**
     * 충전 아이템 삭제
     */
    @PostMapping("charge/delete")
    public String chargeDelete(P_itemChargeDeleteVo pItemChargeDeleteVo) {
        String result = itemService.callContentsChargeItemDelete(pItemChargeDeleteVo);
        return result;
    }



/** ==----------------------------------------- 교환 아이템 ------------------------------------------------------------------*/
    /**
     * 교환 아이템
     */
    @PostMapping("exchange/list")
    public String exchangeList(P_itemExchangeListInputVo pItemExchangeListInputVo) {
        String result = itemService.callContentsExchangeItemList(pItemExchangeListInputVo);
        return result;
    }

    /**
     * 교환 아이템 상세
     */
    @PostMapping("exchange/detail")
    public String exchangeDetail(P_itemExchangeDetailInputVo pItemExchangeDetailInputVo) {
        String result = itemService.callContentsExchangeItemDetail(pItemExchangeDetailInputVo);
        return result;
    }

    /**
     * 교환 아이템 등록
     */
    @PostMapping("exchange/insert")
    public String exchangeInsert(P_itemExchangeInsertVo pItemExchangeInsertVo) {
        String result = itemService.callContentsExchangeItemAdd(pItemExchangeInsertVo);
        return result;
    }

    /**
     * 교환 아이템 수정
     */
    @PostMapping("exchange/update")
    public String exchangeUpdate(P_itemExchangeUpdateVo pItemExchangeUpdateVo) {
        String result = itemService.callContentsExchangeItemEdit(pItemExchangeUpdateVo);
        return result;
    }

    /**
     * 교환 아이템 삭제
     */
    @PostMapping("exchange/delete")
    public String exchangeDelete(P_itemExchangeDeleteVo pItemExchangeDeleteVo) {
        String result = itemService.callContentsExchangeItemDelete(pItemExchangeDeleteVo);
        return result;
    }




/** ==----------------------------------------- 선물 아이템 ------------------------------------------------------------------*/
    /**
     * 선물 아이템
     */
    @PostMapping("gift/list")
    public String giftList(P_itemGiftListInputVo pItemGiftListInputVo) {
        String result = itemService.callContentsGiftItemList(pItemGiftListInputVo);
        return result;
    }

    /**
     * 선물 아이템 상세
     */
    @PostMapping("gift/detail")
    public String giftDetail(P_itemGiftDetailInputVo pItemGiftDetailInputVo) {
        String result = itemService.callContentsGiftItemDetail(pItemGiftDetailInputVo);
        return result;
    }

    /**
     * 선물 아이템 등록
     */
    @PostMapping("gift/insert")
    public String giftInsert(P_itemGiftInsertVo pItemGiftInsertVo) {
        String result = itemService.callContentsGiftItemAdd(pItemGiftInsertVo);
        return result;
    }

    /**
     * 선물 아이템 수정
     */
    @PostMapping("gift/update")
    public String giftUpdate(P_itemGiftUpdateVo pItemGiftUpdateVo) {
        String result = itemService.callContentsGiftItemEdit(pItemGiftUpdateVo);
        return result;
    }

    /**
     * 선물 아이템 삭제
     */
    @PostMapping("gift/delete")
    public String giftDelete(P_itemGiftDeleteVo pItemGiftDeleteVo) {
        String result = itemService.callContentsGiftItemDelete(pItemGiftDeleteVo);
        return result;
    }












    /**
     * 선물 아이템
     */
    @PostMapping("gift/test/list")
    public String giftTestList(P_itemGiftListInputVo pItemGiftListInputVo) {
            String result = itemService.callServiceCenterItemGiftList(pItemGiftListInputVo);
            return result;
    }

    /**
     * 구독 아이템
     */
    @PostMapping("subscribe")
    public String subscribeList(HttpServletRequest request, ItemVo itemVo) {
        int totalCnt = 100;
        int startIdx = itemVo.getPageStart();

        ArrayList<ItemVo> list = new ArrayList<ItemVo>();
        for(int i = 0; i < itemVo.getPageCnt(); i++){
            ItemVo data = new ItemVo();
            data.setRowNum((totalCnt - startIdx));
            data.setItem_col1(DalbitUtil.randomValue("number", 1));
            data.setItem_col2(DalbitUtil.randomValue("number", 1));
            data.setItem_col3("구독 아이템_" + data.getItem_col1());
            data.setItem_col4(new Date());
            data.setItem_col5(DalbitUtil.randomValue("number", 1));
            data.setItem_col6(new Date());
            data.setItem_col7("YOOSIN");

            list.add(data);
            startIdx++;
        }

        ArrayList<ItemVo> summaryList = new ArrayList<ItemVo>();

        ItemVo data = new ItemVo();
        data.setRowNum((totalCnt - startIdx));
        data.setItem_col1(DalbitUtil.randomValue("number", 1));
        data.setItem_col2(DalbitUtil.randomValue("number", 1));
        data.setItem_col3(DalbitUtil.randomValue("number", 1));
        data.setItem_col5(DalbitUtil.randomValue("number", 1));
        data.setItem_col7(DalbitUtil.randomValue("number", 1));

        summaryList.add(data);

        return gsonUtil.toJson(new JsonOutputVo(Status.조회, list, new PagingVo(totalCnt), summaryList));
    }


    /**
     * 방송 아이템
     */
    @PostMapping("broadcast")
    public String broadcastList(HttpServletRequest request, ItemVo itemVo) {
        int totalCnt = 100;
        int startIdx = itemVo.getPageStart();

        ArrayList<ItemVo> list = new ArrayList<ItemVo>();
        for(int i = 0; i < itemVo.getPageCnt(); i++){
            ItemVo data = new ItemVo();
            data.setRowNum((totalCnt - startIdx));
            data.setItem_col1(DalbitUtil.randomValue("number", 1));
            data.setItem_col2(DalbitUtil.randomValue("number", 1));
            data.setItem_col3("방송 아이템_" + data.getItem_col1());
            data.setItem_col4(new Date());
            data.setItem_col5(DalbitUtil.randomValue("number", 1));
            data.setItem_col6(new Date());
            data.setItem_col7("YOOSIN");

            list.add(data);
            startIdx++;
        }

        ArrayList<ItemVo> summaryList = new ArrayList<ItemVo>();

        ItemVo data = new ItemVo();
        data.setRowNum((totalCnt - startIdx));
        data.setItem_col1(DalbitUtil.randomValue("number", 1));
        data.setItem_col2(DalbitUtil.randomValue("number", 1));
        data.setItem_col3(DalbitUtil.randomValue("number", 1));
        data.setItem_col5(DalbitUtil.randomValue("number", 1));
        data.setItem_col7(DalbitUtil.randomValue("number", 1));

        summaryList.add(data);

        return gsonUtil.toJson(new JsonOutputVo(Status.조회, list, new PagingVo(totalCnt), summaryList));
    }

    @PostMapping("sendChangeItem")
    public String sendSocketReload(HttpServletRequest request){
        HashMap<String,Object> param = new HashMap<>();

        Map<String, Object> result = socketService.changeItem(DalbitUtil.getProperty("temp.memNo"), jwtUtil.generateToken(DalbitUtil.getProperty("temp.memNo")), true);

//        Map<String, Object> result = socketUtil.setSocket(param,"reqChangeItem","reqChangeItem", jwtUtil.generateToken(DalbitUtil.getProperty("temp.memNo"), true));

        if(!result.get("error").equals("")){
            log.error("[아이템 reqChangeItem Socket Error : {}]", result.get("error"));
            return gsonUtil.toJson(new JsonOutputVo(ErrorStatus.서버처리중오류));
        }

        return gsonUtil.toJson(new JsonOutputVo(Status.처리완료));
    }


    /**
     * 퀵 메시지
     */
    @PostMapping("quick")
    public String quick() {
        String result = itemService.getQuickList();
        return result;
    }

    /**
     * 아이템 순서 변경 조회
     */
    @PostMapping("gift/order/list")
    public String giftOrderList(GiftOrder giftOrder) {
        try {
            return itemService.getGiftOrderList(giftOrder);
        } catch (Exception e) {
            return gsonUtil.toJson(new JsonOutputVo(Status.비즈니스로직오류));
        }
    }

    /**
     * 아이템 순서 변경 수정
     */
    @PostMapping("set/giftList")
    public String setGiftList(GiftOrder giftOrder) {
        try {
            return itemService.setGiftOrderList(giftOrder);
        } catch (Exception e) {
            return gsonUtil.toJson(new JsonOutputVo(Status.비즈니스로직오류));
        }
    }

}
