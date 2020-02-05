package com.dalbit.broadcast.controller;


import com.dalbit.broadcast.service.B_BroadcastService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Slf4j
@Controller
@RequestMapping("/broadcast/broadcast")
public class B_BroadcastController {

    @Autowired
    B_BroadcastService bBroadcastService;

    /**
     * 회원리스트
     * @param model
     * @return
     */
    @GetMapping("list")
    public String list(Model model) {
        return "broadcast/broadcast/list";
    }
}
