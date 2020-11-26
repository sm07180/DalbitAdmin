package com.dalbit.broadcast.controller;


import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Slf4j
@Controller
@RequestMapping("/broadcast/behavior")
public class Bro_BehaviorController {

    /**
     * 청취자 행위 유도 메시지 조회
     */
    @GetMapping("list")
    public String list(Model model) {
        return "broadcast/behavior/list";
    }

}
