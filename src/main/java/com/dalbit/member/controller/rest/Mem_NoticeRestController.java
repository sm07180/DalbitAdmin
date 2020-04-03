package com.dalbit.member.controller.rest;

import com.dalbit.excel.service.ExcelService;
import com.dalbit.member.service.Mem_NoticeService;
import com.dalbit.member.vo.procedure.P_MemberNoticeInputVo;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
@RequestMapping("rest/member/notice")
public class Mem_NoticeRestController {

    @Autowired
    Mem_NoticeService mem_NoticeService;

    @Autowired
    ExcelService excelService;

    @Autowired
    GsonUtil gsonUtil;

    /**
     * 회원 공지 목록
     */
    @PostMapping("list")
    public String list(P_MemberNoticeInputVo pMemberNoticeInputVo){
        return mem_NoticeService.getNoticeHistory(pMemberNoticeInputVo);

    }
}
