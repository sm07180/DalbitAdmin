package com.dalbit.administrate.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Slf4j
@Controller
@RequestMapping("administrate/theme")
public class A_ThemeController {

    /**
     * 리스트
     * @return
     */
    @GetMapping("list")
    public String list() {

        return "administrate/theme/list";
    }
}
