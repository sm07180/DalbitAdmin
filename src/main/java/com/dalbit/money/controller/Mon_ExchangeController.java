package com.dalbit.money.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Slf4j
@Controller
@RequestMapping("money/exchange")
public class Mon_ExchangeController {

    @GetMapping("list")
    public String list() {
        return "money/exchange/list";
    }
}
