package com.dalbit.member.controller.rest;

import com.dalbit.excel.service.ExcelService;
import com.dalbit.member.service.Mem_MemberService;
import com.dalbit.member.vo.procedure.P_MemberInfoInputVo;
import com.dalbit.member.vo.procedure.P_MemberListInputVo;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
@RequestMapping("rest/member/member")
public class Mem_MemberRestController {

    @Autowired
    Mem_MemberService mMemberService;
    @Autowired
    ExcelService excelService;

    @Autowired
    GsonUtil gsonUtil;

    @PostMapping("list")
    public String list(P_MemberListInputVo pMemberListInputVo){
        String result = mMemberService.getMemberList(pMemberListInputVo);
        return result;
    }

    @PostMapping("info")
    public String info(P_MemberInfoInputVo pMemberInfoInputVo){
        String result = mMemberService.getMemberInfo(pMemberInfoInputVo);
        return result;
    }
}
