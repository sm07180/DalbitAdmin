package com.dalbit.menu.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Slf4j
@Controller
@RequestMapping("menu/live")
public class Men_LiveController {

    @RequestMapping("list")
    public String list(){
        return "menu/live/list";
    }
}
