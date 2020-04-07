package com.dalbit.member.controller.rest;

import com.dalbit.excel.service.ExcelService;
import com.dalbit.member.service.Mem_BanwordService;
import com.dalbit.member.vo.procedure.P_MemberBanwordInputVo;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
@RequestMapping("rest/member/banword")
public class Mem_BanwordRestController {

    @Autowired
    Mem_BanwordService mem_BanwordService;

    @Autowired
    ExcelService excelService;

    @Autowired
    GsonUtil gsonUtil;

    /**
     * 회원 금지어 목록
     */
    @PostMapping("list")
    public String list(P_MemberBanwordInputVo pMemberBanwordInputVo){
        String result = mem_BanwordService.getBanwordHistory(pMemberBanwordInputVo);
        return result;

    }
}
