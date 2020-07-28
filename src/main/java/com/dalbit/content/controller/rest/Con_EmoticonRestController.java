package com.dalbit.content.controller.rest;

import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.common.vo.PagingVo;
import com.dalbit.content.service.Con_BannerService;
import com.dalbit.content.service.Con_EmoticonService;
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
@RequestMapping("rest/content/emoticon")
public class Con_EmoticonRestController {

    @Autowired
    Con_EmoticonService conEmoticonService;

    @Autowired
    GsonUtil gsonUtil;



    /**
     * 인싸티콘 카테고리 리스트
     */
    @PostMapping("inssaticon/category/list")
    public String inssaticonCategoryList(P_bannerListInputVo pBannerListInputVo) {
        String result = conEmoticonService.callContentsInssaticonCategoryList(pBannerListInputVo);
        return result;
    }

    /**
     * 인싸티콘 리스트
     */
    @PostMapping("inssaticon/list")
    public String inssaticonList(P_bannerListInputVo pBannerListInputVo) {
        String result = conEmoticonService.callContentsInssaticonList(pBannerListInputVo);
        return result;
    }

    /**
     * 인싸티콘 상세정보
     */
    @PostMapping("inssaticon/detail")
    public String inssaticonDetail(P_bannerDetailInputVo pBannerDetailInputVo) {
        String result = conEmoticonService.callContentsInssaticonDetail(pBannerDetailInputVo);
        return result;
    }

    /**
     * 인싸티콘 순서 변경
     */
    @PostMapping("inssaticon/order/edit")
    public String inssaticonOderEdit(P_bannerDetailInputVo pBannerDetailInputVo) {
        String result = conEmoticonService.callContentsInssaticonOrderEdit(pBannerDetailInputVo);
        return result;
    }

    /**
     * 인싸티콘 등록
     */
    @PostMapping("inssaticon/insert")
    public String bannerInsert(P_bannerInsertVo pBannerInsertVo) {
        String result = conEmoticonService.callContentsInssaticonAdd(pBannerInsertVo);
        return result;
    }

    /**
     * 인싸티콘 수정
     */
    @PostMapping("inssaticon/update")
    public String bannerUpdate(P_bannerUpdateVo pBannerUpdateVo) {
        String result = conEmoticonService.callContentsInssaticonEdit(pBannerUpdateVo);
        return result;
    }

    /**
     * 인싸티콘 삭제
     */
    @PostMapping("inssaticon/delete")
    public String bannerDelete(P_bannerDeleteVo pBannerDeleteVo) {
        String result = conEmoticonService.callContentsInssaticonDelete(pBannerDeleteVo);
        return result;
    }

}
