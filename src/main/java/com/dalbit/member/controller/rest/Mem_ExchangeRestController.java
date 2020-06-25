package com.dalbit.member.controller.rest;

import com.dalbit.excel.service.ExcelService;
import com.dalbit.member.service.Mem_ExchangeService;
import com.dalbit.member.vo.procedure.P_MemberExchangeInputVo;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
@RequestMapping("rest/member/exchange")
public class Mem_ExchangeRestController {

    @Autowired
    Mem_ExchangeService mem_ExchangeService;

    @Autowired
    ExcelService excelService;

    @Autowired
    GsonUtil gsonUtil;

    /**
     * 회원 환전 목록
     */
    @PostMapping("list")
    public String list(P_MemberExchangeInputVo pMemberExchangeInputVo){
        String result = mem_ExchangeService.getExchangeHistory(pMemberExchangeInputVo);
        return result;
    }

    /**
     * 회원 환전 목록 상세보기
     */
    @PostMapping("detail")
    public String detail(P_MemberExchangeInputVo pMemberExchangeInputVo){
        String result = mem_ExchangeService.getExchangeHistory_detail(pMemberExchangeInputVo);
        return result;
    }
}
