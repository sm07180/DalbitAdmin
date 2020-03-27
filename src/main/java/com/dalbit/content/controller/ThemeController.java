package com.dalbit.content.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Slf4j
@Controller
@RequestMapping("/content/theme")
public class ThemeController {

    @GetMapping("/list")
    public String list() {
        return "content/theme/list";
    }
}
