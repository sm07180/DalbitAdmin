package com.dalbit.member.controller.rest;

import com.dalbit.excel.service.ExcelService;
import com.dalbit.member.service.Mem_GiftService;
import com.dalbit.member.vo.procedure.P_MemberGiftInputVo;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
@RequestMapping("rest/member/gift")
public class Mem_GiftRestController {

    @Autowired
    Mem_GiftService mem_GiftService;

    @Autowired
    ExcelService excelService;

    @Autowired
    GsonUtil gsonUtil;

    /**
     * 회원 선물/교환내역 목록
     */
    @PostMapping("list")
    public String list(P_MemberGiftInputVo pMemberGiftInputVo){
        String result = mem_GiftService.getGiftHistory(pMemberGiftInputVo);
        return result;

    }
}
