package com.dalbit.member.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Slf4j
@Controller
@RequestMapping("member/listen")
public class Mem_ListenController {

    /**
     * 회원 청취 리스트
     * @param model
     * @return
     */
    @PostMapping("list")
    public String list(Model model){
        return "member/listen/list";
    }

}
