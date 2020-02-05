package com.dalbit.member.controller;

import com.dalbit.member.service.M_BroadcastService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Slf4j
@Controller
@RequestMapping("member/broadcast")
public class M_BroadcastController {

    @Autowired
    M_BroadcastService mBroadcastService;

    /**
     * 회원프로필 > 방송기록
     * @param model
     * @return
     */
    @GetMapping("list")
    public String list(Model model){
        return "member/broadcast/list";
    }

}
