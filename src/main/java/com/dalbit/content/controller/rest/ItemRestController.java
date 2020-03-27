package com.dalbit.content.controller.rest;

import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.common.vo.PagingVo;
import com.dalbit.content.service.EventService;
import com.dalbit.content.service.ItemService;
import com.dalbit.content.vo.ItemVo;
import com.dalbit.content.vo.ItemVo;
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
    ItemService service;

    @Autowired
    GsonUtil gsonUtil;

    /**
     * 충전 아이템
     */
    @PostMapping("charge")
    public String chargeList(HttpServletRequest request, ItemVo itemVo) {
        int totalCnt = 100;
        int startIdx = itemVo.getPageStart();

        ArrayList<ItemVo> list = new ArrayList<ItemVo>();
        for(int i = 0; i < itemVo.getPageCnt(); i++){
            ItemVo data = new ItemVo();
            data.setRowNum((totalCnt - startIdx));
            data.setItem_col1(DalbitUtil.randomValue("number", 1));
            data.setItem_col2(DalbitUtil.randomValue("number", 1));
            data.setItem_col3("충전 아이템_" + data.getItem_col1());
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
     * 교환 아이템
     */
    @PostMapping("exchange")
    public String exchangeList(HttpServletRequest request, ItemVo itemVo) {
        int totalCnt = 100;
        int startIdx = itemVo.getPageStart();

        ArrayList<ItemVo> list = new ArrayList<ItemVo>();
        for(int i = 0; i < itemVo.getPageCnt(); i++){
            ItemVo data = new ItemVo();
            data.setRowNum((totalCnt - startIdx));
            data.setItem_col1(DalbitUtil.randomValue("number", 1));
            data.setItem_col2(DalbitUtil.randomValue("number", 1));
            data.setItem_col3("교환 아이템_" + data.getItem_col1());
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
     * 선물 아이템
     */
    @PostMapping("gift")
    public String giftList(HttpServletRequest request, ItemVo itemVo) {
        int totalCnt = 100;
        int startIdx = itemVo.getPageStart();

        ArrayList<ItemVo> list = new ArrayList<ItemVo>();
        for(int i = 0; i < itemVo.getPageCnt(); i++){
            ItemVo data = new ItemVo();
            data.setRowNum((totalCnt - startIdx));
            data.setItem_col1(DalbitUtil.randomValue("number", 1));
            data.setItem_col2(DalbitUtil.randomValue("number", 1));
            data.setItem_col3("선물 아이템_" + data.getItem_col1());
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
