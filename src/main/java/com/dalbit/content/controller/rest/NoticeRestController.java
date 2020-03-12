package com.dalbit.content.controller.rest;

import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.content.service.NoticeService;
import com.dalbit.content.vo.procedure.*;
import com.dalbit.excel.service.ExcelService;
import com.dalbit.exception.GlobalException;
import com.dalbit.util.GsonUtil;
import com.dalbit.util.MessageUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@Slf4j
@RestController
@RequestMapping("rest/content/notice")
public class NoticeRestController {

    @Autowired
    NoticeService noticeService;

    @Autowired
    ExcelService excelService;

    @Autowired
    GsonUtil gsonUtil;

    @Autowired
    MessageUtil messageUtil;

    /**
     * 사이트 공지 보기
     */
    @PostMapping("list")
    public String list(P_noticeListInputVo pNoticeListInputVo) {
        String result = noticeService.callServiceCenterNoticeList(pNoticeListInputVo);
        return result;
    }

    /**
     * 사이트 공지 엑셀
     */
    @PostMapping("listExcel")
    public String listExcel(HttpServletRequest request, HttpServletResponse response, Model model, P_noticeListInputVo pNoticeListInputVo) throws GlobalException {

        Model resultModel = noticeService.getListExcel(pNoticeListInputVo, model);

        excelService.renderMergedOutputModel(resultModel.asMap(), request, response);
        return gsonUtil.toJson(new JsonOutputVo(Status.엑셀다운로드성공));

    }


    /**
     * 사이트 공지 상세 조회
     */
    @PostMapping("detail")
    public String detail(P_noticeDetailInputVo p_noticeDetailInputVo) {
        String result = noticeService.callServiceCenterNoticeListDetail(p_noticeDetailInputVo);
        return result;
    }

    /**
     * 사이트 공지 등록
     */
    @PostMapping("insert")
    public String insert(P_noticeInsertVo pNoticeInsertVo) {
        String result = noticeService.callServiceCenterNoticeAdd(pNoticeInsertVo);
        return result;
    }

    /**
     * 사이트 공지 수정
     */
    @PostMapping("update")
    public String update(P_noticeUpdateVo pNoticeUpdateVo) {
        String result = noticeService.callServiceCenterNoticeUpdate(pNoticeUpdateVo);
        return result;
    }

    /**
     * 사이트 공지 삭제
     */
    @PostMapping("delete")
    public String delete(P_noticeDeleteVo pNoticeDeleteVo) {
        String result = noticeService.callServiceCenterNoticeDelete(pNoticeDeleteVo);
        return result;
    }

}
