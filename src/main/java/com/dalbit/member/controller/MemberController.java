package com.dalbit.member.controller;

import com.dalbit.member.service.MemberService;
import com.dalbit.member.vo.MemberListVo;
import com.dalbit.sample.service.SampleService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Slf4j
@Controller
@RequestMapping("member/member")
public class MemberController {

    @Autowired
    MemberService memberService;

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
