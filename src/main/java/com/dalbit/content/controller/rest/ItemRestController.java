package com.dalbit.content.controller.rest;

import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.common.vo.PagingVo;
import com.dalbit.content.service.EventService;
import com.dalbit.content.service.ItemService;
import com.dalbit.content.vo.ItemVo;
import com.dalbit.content.vo.ItemVo;
import com.dalbit.content.vo.procedure.*;
import com.dalbit.util.DalbitUtil;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Date;

@Slf4j
@RestController
@RequestMapping("rest/content/item")
public class ItemRestController {

    @Autowired
    ItemService itemService;

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






    /**
     * 선물 아이템
     */
    @PostMapping("gift/list")
    public String giftList(P_itemGiftListInputVo pItemGiftListInputVo) {
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

}
