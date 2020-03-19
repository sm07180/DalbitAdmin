package com.dalbit.member.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Slf4j
@Controller
@RequestMapping("member/broadcast")
public class Mem_BroadcastController {

    /**
     * 회원 방송 리스트
     * @param model
     * @return
     */
    @PostMapping("list")
    public String list(Model model){
        return "member/broadcast/list";
    }

}
