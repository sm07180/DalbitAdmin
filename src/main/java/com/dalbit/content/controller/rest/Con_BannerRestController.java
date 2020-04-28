package com.dalbit.content.controller.rest;

import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.common.vo.PagingVo;
import com.dalbit.content.service.Con_BannerService;
import com.dalbit.content.vo.BannerVo;
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

@Slf4j
@RestController
@RequestMapping("rest/content/banner")
public class Con_BannerRestController {

    @Autowired
    Con_BannerService con_BannerService;

    @Autowired
    GsonUtil gsonUtil;


    /**
     * 배너 아이템
     */
    @PostMapping("list")
    public String bannerList(P_bannerListInputVo pBannerListInputVo) {
        String result = con_BannerService.callContentsBannerList(pBannerListInputVo);
        return result;
    }

    /**
     * 배너 아이템 상세
     */
    @PostMapping("detail")
    public String bannerDetail(P_bannerDetailInputVo pBannerDetailInputVo) {
        String result = con_BannerService.callContentsBannerDetail(pBannerDetailInputVo);
        return result;
    }

    /**
     * 배너 아이템 등록
     */
    @PostMapping("insert")
    public String bannerInsert(P_bannerInsertVo pBannerInsertVo) {
        String result = con_BannerService.callContentsBannerAdd(pBannerInsertVo);
        return result;
    }

    /**
     * 배너 아이템 수정
     */
    @PostMapping("update")
    public String bannerUpdate(P_bannerUpdateVo pBannerUpdateVo) {
        String result = con_BannerService.callContentsBannerEdit(pBannerUpdateVo);
        return result;
    }

    /**
     * 배너 아이템 삭제
     */
    @PostMapping("delete")
    public String bannerDelete(P_bannerDeleteVo pBannerDeleteVo) {
        String result = con_BannerService.callContentsBannerDelete(pBannerDeleteVo);
        return result;
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
