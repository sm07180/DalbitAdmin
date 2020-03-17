package com.dalbit.menu.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Slf4j
@Controller
@RequestMapping("menu/special")
public class Men_SpecialController {

    @RequestMapping("list")
    public String list(){
        return "menu/special/list";
    }
}
