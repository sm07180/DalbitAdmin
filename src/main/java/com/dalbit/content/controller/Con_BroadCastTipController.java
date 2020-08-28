package com.dalbit.content.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Slf4j
@Controller
@RequestMapping("/content/broadCastTip")
public class Con_BroadCastTipController {

    @GetMapping("/list")
    public String list() {
        return "content/broadCastTip/list";
    }


}
