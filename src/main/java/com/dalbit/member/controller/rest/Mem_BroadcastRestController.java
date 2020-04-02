package com.dalbit.member.controller.rest;

import com.dalbit.excel.service.ExcelService;
import com.dalbit.member.service.Mem_BroadcastService;
import com.dalbit.member.vo.procedure.P_MemberBroadcastInputVo;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
@RequestMapping("rest/member/broadcast")
public class Mem_BroadcastRestController {

    @Autowired
    Mem_BroadcastService mem_BroadcastService;

    @Autowired
    ExcelService excelService;

    @Autowired
    GsonUtil gsonUtil;

    /**
     * 회원 방송 목록
     */
    @PostMapping("list")
    public String list(P_MemberBroadcastInputVo pMemberBroadcastInputVo){
        String result = mem_BroadcastService.getBroadHistory(pMemberBroadcastInputVo);
        return result;

    }
}
