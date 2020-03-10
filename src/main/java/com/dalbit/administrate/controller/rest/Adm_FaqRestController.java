package com.dalbit.administrate.controller.rest;

import com.dalbit.administrate.service.Adm_FaqService;
import com.dalbit.administrate.vo.procedure.*;
import com.dalbit.util.GsonUtil;
import com.dalbit.util.MessageUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
@RequestMapping("rest/administrate/faq")
public class Adm_FaqRestController {

    @Autowired
    Adm_FaqService adm_FaqService;

    @Autowired
    GsonUtil gsonUtil;

    @Autowired
    MessageUtil messageUtil;

    /**
     * FAQ 보기
     */
    @PostMapping("list")
    public String list(P_FaqListInputVo pFaqListInputVo) {
        String result = adm_FaqService.callFaqList(pFaqListInputVo);
        return result;
    }


    /**
     * FAQ 조회
     */
    @PostMapping("detail")
    public String detail(P_FaqListDetailInputVo pFaqListDetailInputVo) {
        String result = adm_FaqService.callFaqListDetail(pFaqListDetailInputVo);
        return result;
    }

    /**
     * FAQ 등록
     */
    @PostMapping("insert")
    public String insert(P_FaqInsertVo pFaqInsertVo) {
        String result = adm_FaqService.callFaqAdd(pFaqInsertVo);
        return result;
    }

    /**
     * FAQ 수정
     */
    @PostMapping("update")
    public String update(P_FaqUpdateVo pFaqUpdateVo) {
        String result = adm_FaqService.callFaqUpdate(pFaqUpdateVo);
        return result;
    }

    /**
     * FAQ 삭제
     */
    @PostMapping("delete")
    public String delete(P_FaqDeleteVo pFaqDeleteVo) {
        String result = adm_FaqService.callFaqDelete(pFaqDeleteVo);
        return result;
    }

}
