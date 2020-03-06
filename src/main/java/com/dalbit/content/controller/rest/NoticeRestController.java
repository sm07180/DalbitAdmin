package com.dalbit.content.controller.rest;

import com.dalbit.content.service.NoticeService;
import com.dalbit.content.vo.procedure.P_noticeListInputVo;
import com.dalbit.content.vo.procedure.P_noticeListOutputVo;
import com.dalbit.util.DalbitUtil;
import com.dalbit.util.GsonUtil;
import com.dalbit.util.MessageUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;

@Slf4j
@RestController
@RequestMapping("rest/content/notice")
public class NoticeRestController {

    @Autowired
    NoticeService noticeService;

    @Autowired
    GsonUtil gsonUtil;

    @Autowired
    MessageUtil messageUtil;

    /**
     * 사이트 공지 보기
     */
    @PostMapping("list")
    public String list(HttpServletRequest request, P_noticeListInputVo pNoticeListInputVo) {

        /*pNoticeListInputVo.setPageNo(1);
        pNoticeListInputVo.setPageCnt(10);*/

        /*pNoticeListOutputVo.setNoticeIdx(DalbitUtil.convertRequestParamToInteger(request,"noticeIdx"));
        pNoticeListOutputVo.setSlctType(DalbitUtil.convertRequestParamToInteger(request,"slctType"));
        pNoticeListOutputVo.setTitle(DalbitUtil.convertRequestParamToString(request,"title"));
        pNoticeListOutputVo.setTopFix(DalbitUtil.convertRequestParamToInteger(request,"topFix"));
        pNoticeListOutputVo.setViewOn(DalbitUtil.convertRequestParamToInteger(request,"viewOn"));
        pNoticeListOutputVo.setWriterName(DalbitUtil.convertRequestParamToString(request,"writerName"));
        pNoticeListOutputVo.setWriterNo(DalbitUtil.convertRequestParamToInteger(request,"writerNo"));
        pNoticeListOutputVo.setWriterDate(DalbitUtil.convertRequestParamToString(request,"writerDate"));*/

        String result =noticeService.callServiceCenterNoticeList(pNoticeListInputVo);

        return result;
    }

}
