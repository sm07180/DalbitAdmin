package com.dalbit.menu.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Slf4j
@Controller
@RequestMapping("menu/best")
public class BestController {

    @RequestMapping("list")
    public String list(){
        return "menu/best/list";
    }
}