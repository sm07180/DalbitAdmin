package com.dalbit.member.controller.rest;

import com.dalbit.excel.service.ExcelService;
import com.dalbit.member.service.Mem_JoinService;
import com.dalbit.member.vo.procedure.P_MemberJoinInputVo;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
@RequestMapping("rest/member/join")
public class Mem_JoinRestController {

    @Autowired
    Mem_JoinService mem_JoinService;

    @Autowired
    ExcelService excelService;

    @Autowired
    GsonUtil gsonUtil;

    /**
     * 회원가입 목록
     */
    @PostMapping("list")
    public String list(P_MemberJoinInputVo pMemberJoinInputVo){
        return mem_JoinService.getJoinList(pMemberJoinInputVo);
    }

    /**
    * 회원탈퇴 목록
    */
     @PostMapping("withdrawalList")
     public String withdrawalList(P_MemberJoinInputVo pMemberJoinInputVo){
         return mem_JoinService.getWithdrawalList(pMemberJoinInputVo);
     }
}
