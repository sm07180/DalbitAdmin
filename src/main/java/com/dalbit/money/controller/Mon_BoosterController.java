package com.dalbit.money.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Slf4j
@Controller
@RequestMapping("money/booster")
public class Mon_BoosterController {

    @GetMapping("list")
    public String info() {
        return "money/booster/list";
    }


}
