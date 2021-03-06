package com.dalbit.menu.controller.rest;

import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.excel.service.ExcelService;
import com.dalbit.exception.GlobalException;
import com.dalbit.menu.service.Men_StarService;
import com.dalbit.menu.vo.SpecialReqVo;
import com.dalbit.menu.vo.procedure.P_StarInputVo;
import com.dalbit.menu.vo.procedure.P_StarScoreInputVo;
import com.dalbit.menu.vo.procedure.P_StarSearchInputVo;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Slf4j
@RestController
@RequestMapping("rest/menu/star")
public class Men_StarRestController {

    @Autowired
    GsonUtil gsonUtil;

    @Autowired
    Men_StarService menStarService;

    @Autowired
    ExcelService excelService;

    /**
     * 스타 dj 등록 후 달/부스터/아이템 지급
     *
     * @param pStarInputVo
     * @return
     */
    @PostMapping("create")
    public String createStarDJ(P_StarInputVo pStarInputVo) {
        return menStarService.createStarDJ(pStarInputVo);
    }

    /**
     * 스타 dj 삭제
     *
     * @param pStarInputVo
     * @return
     */
    @PostMapping("remove")
    public String removeStarDJ(P_StarInputVo pStarInputVo) {
        return menStarService.removeStarDJ(pStarInputVo);
    }

    /**
     * 스타DJ 가산점 점수 수정
     *
     * @param pStarScoreInputVo
     * @return
     */
    @PostMapping("modify-point")
    public String modifyPointStarDJ(P_StarScoreInputVo pStarScoreInputVo) {
        return menStarService.modifyPointStarDJ(pStarScoreInputVo);
    }

    /**
     * 스타 DJ 신청 리스트
     *
     * @param pStarSearchInputVo
     * @return
     */
    @GetMapping("req-list")
    public String findReqStarDJ(P_StarSearchInputVo pStarSearchInputVo) {
        return menStarService.findReqStarDJ(pStarSearchInputVo);
    }

    /**
     * 스타 DJ 신청 리스트 - 엑셀다운로드
     *
     * @param pStarSearchInputVo
     * @return
     */
    @PostMapping("req-list/excel")
    public String findReqStarDJExcel(HttpServletRequest request, HttpServletResponse response, Model model, P_StarSearchInputVo pStarSearchInputVo) throws GlobalException {
        Model resultModel = menStarService.findReqStarDJExcel(pStarSearchInputVo, model);
        excelService.renderMergedOutputModel(resultModel.asMap(), request, response);
        return gsonUtil.toJson(new JsonOutputVo(Status.엑셀다운로드성공));
    }

    /**
     * 스타 DJ 리스트
     *
     * @param pStarSearchInputVo
     * @return
     */
    @GetMapping("list")
    public String findStarDJ(P_StarSearchInputVo pStarSearchInputVo) {
        return menStarService.findStarDJ(pStarSearchInputVo);
    }
}
