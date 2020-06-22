package com.dalbit.member.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Slf4j
@Controller
@RequestMapping("member/member")
public class Mem_MemberController {

    /**
     * 회원리스트
     * @param model
     * @return
     */
    @GetMapping("list")
    public String list(Model model) {
        log.info("회원정보입니다.");
        return "member/member/list";
    }

    @RequestMapping("popup/memberPopup")
    public String memberPopup(Model model) { return "member/member/popup/memberPopup"; }

    @RequestMapping("popup/reportPopup")
    public String reportPopup(Model model) { return "member/member/popup/reportPopup"; }

    @RequestMapping("popup/memberTestid")
    public String memberTestid(Model model) { return "member/member/popup/memberTestid"; }


    @RequestMapping("login/history")
    public String loginHistory(Model model) { return "member/login/history"; }
}
