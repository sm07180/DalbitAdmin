package com.dalbit.administrate.controller.rest;

import com.dalbit.administrate.service.Adm_TermsService;
import com.dalbit.administrate.vo.procedure.P_TermsDetailInputVo;
import com.dalbit.administrate.vo.procedure.P_TermsListInputVo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
@RequestMapping("rest/administrate/terms")
public class Adm_TermsRestController {

    @Autowired
    Adm_TermsService adm_TermsService;

    /**
     * 서비스 이용약관 보기
     */
    @PostMapping("list")
    public String list(P_TermsListInputVo pTermsListInputVo) {
        String result = adm_TermsService.callTermsList(pTermsListInputVo);
        return result;
    }

    /**
     * 서비스 이용약관 수정
     */
    @PostMapping("update")
    public String update(P_TermsDetailInputVo pTermsDetailInputVo) {
        String result = adm_TermsService.callTermsUpdate(pTermsDetailInputVo);
        return result;
    }

    /**
     * 서비스 이용약관 등록
     */
    @PostMapping("insert")
    public String insert(P_TermsDetailInputVo pTermsDetailInputVo) {
        String result = adm_TermsService.callTermsInsert(pTermsDetailInputVo);
        return result;
    }

    /**
     * 서비스 이용약관 삭제
     */
    @PostMapping("delete")
    public String delete(P_TermsDetailInputVo pTermsDetailInputVo) {
        String result = adm_TermsService.callTermsDelete(pTermsDetailInputVo);
        return result;
    }
}
