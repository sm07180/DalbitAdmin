package com.dalbit.enter.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Slf4j
@Controller
@RequestMapping("/enter/join")
public class Ent_JoinController {

    @GetMapping("/info")
    public String list() {
        return "enter/join/info";
    }


}
