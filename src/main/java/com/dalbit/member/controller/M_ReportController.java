package com.dalbit.member.controller;

import com.dalbit.member.service.M_NoticeService;
import com.dalbit.member.service.M_ReportService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Slf4j
@Controller
@RequestMapping("member/report")
public class M_ReportController {

    @Autowired
    M_ReportService mReportService;

    /**
     * 회원리스트
     * @param model
     * @return
     */
    @GetMapping("list")
    public String list(Model model){
        return "member/notice/list";
    }


}
