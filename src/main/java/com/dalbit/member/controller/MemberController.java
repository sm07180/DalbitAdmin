package com.dalbit.member.controller;

import com.dalbit.sample.service.SampleService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Slf4j
@Controller
@RequestMapping("member")
public class MemberController {

    @Autowired
    SampleService sampleService;

    /**
     * 회원리스트
     * @param model
     * @return
     */
    @GetMapping("list")
    public String list(Model model){
        return "/member/list";
    }

    /**
     * 회원프로필
     * @param model
     * @return
     */
    @GetMapping("profile")
    public String profile(Model model){
        return "/member/profile";
    }

    /**
     * 회원프로필 > 방송기록
     * @param model
     * @return
     */
    @GetMapping("profile/broadList")
    public String profileBroadList(Model model){
        return "/member/profile/broadList";
    }

}
