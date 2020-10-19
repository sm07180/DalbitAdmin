package com.dalbit.enter.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Slf4j
@Controller
@RequestMapping("/enter/newJoin2")
public class Ent_NewJoin2Controller {

    @GetMapping("/join/info")
    public String joinList() {
        return "enter/newJoin2/join/info";
    }

    @GetMapping("/withdrawal/info")
    public String withdrawalList() {
        return "enter/newJoin2/withdrawal/info";
    }


}
