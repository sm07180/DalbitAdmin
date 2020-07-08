package com.dalbit.main.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Slf4j
@Controller
@RequestMapping("/main")
public class MainController {
    @GetMapping("")
    public String list(HttpServletRequest request, HttpSession httpSession) {
        return "main/main";
    }

    @GetMapping("/new")
    public String newMain(HttpServletRequest request, HttpSession httpSession) {
        return "main/new_main";
    }
}
