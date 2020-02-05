package com.dalbit.member.controller;

import com.dalbit.member.service.M_MemberService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Slf4j
@Controller
@RequestMapping("member/member")
public class M_MemberController {

    @Autowired
    M_MemberService mMemberService;

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

}
