package com.dalbit.member.controller.rest;

import com.dalbit.excel.service.ExcelService;
import com.dalbit.member.service.Mem_MystarService;
import com.dalbit.member.vo.procedure.P_MemberMystarInputVo;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
@RequestMapping("rest/member/mystar")
public class Mem_MystarRestController {

    @Autowired
    Mem_MystarService mem_MystarService;
    @Autowired
    ExcelService excelService;
    @Autowired
    GsonUtil gsonUtil;

    /**
     * 회원 Mystar 목록
     */
    @PostMapping("mystarlist")
    public String mystarlist(P_MemberMystarInputVo pMemberMystarInputVo){
        return mem_MystarService.getMystarHistory(pMemberMystarInputVo);

    }

    /**
     * 회원 Myfan 목록
     */
    @PostMapping("myfanlist")
    public String myfanlist(P_MemberMystarInputVo pMemberMystarInputVo){
        return mem_MystarService.getFanHistory(pMemberMystarInputVo);

    }
}
