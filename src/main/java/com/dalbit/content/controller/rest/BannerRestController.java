package com.dalbit.content.controller.rest;

import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.common.vo.PagingVo;
import com.dalbit.content.service.BannerService;
import com.dalbit.content.vo.BannerVo;
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
@RequestMapping("rest/content/banner")
public class BannerRestController {

    @Autowired
    BannerService service;

    @Autowired
    GsonUtil gsonUtil;

    /**
     * 배너관리
     */
    @PostMapping("list")
    public String list(HttpServletRequest request, BannerVo bannerVo) {
        int totalCnt = 100;
        int startIdx = bannerVo.getPageStart();

        ArrayList<BannerVo> list = new ArrayList<BannerVo>();
        for(int i = 0; i < bannerVo.getPageCnt(); i++){
            BannerVo data = new BannerVo();
            data.setRowNum((totalCnt - startIdx));
            data.setBanner_col1(DalbitUtil.randomValue("number", 1));
            data.setBanner_col2(DalbitUtil.randomValue("number", 1));
            data.setBanner_col3("메시지 제목 이란다 ㅋㅋㅋㅋㅋ _" + data.getBanner_col1());
            data.setBanner_col4(new Date());
            data.setBanner_col5(DalbitUtil.randomValue("number", 1));
            data.setBanner_col6(new Date());
            data.setBanner_col7("YOOSIN");

            list.add(data);
            startIdx++;
        }

        return gsonUtil.toJson(new JsonOutputVo(Status.조회, list, new PagingVo(totalCnt)));
    }


    @PostMapping("statistics")
    public String statisticsList(HttpServletRequest request, BannerVo bannerVo) {
        int totalCnt = 100;
        int startIdx = bannerVo.getPageStart();

        ArrayList<BannerVo> list = new ArrayList<BannerVo>();

        BannerVo data = new BannerVo();
        data.setRowNum((totalCnt - startIdx));
        data.setBanner_col1(DalbitUtil.randomValue("number", 1));
        data.setBanner_col2(DalbitUtil.randomValue("number", 1));
        data.setBanner_col3(DalbitUtil.randomValue("number", 1));
        data.setBanner_col5(DalbitUtil.randomValue("number", 1));

        list.add(data);

        return gsonUtil.toJson(new JsonOutputVo(Status.조회, list, new PagingVo(totalCnt)));
    }
}
