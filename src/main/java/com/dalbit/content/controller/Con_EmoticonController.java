package com.dalbit.content.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Slf4j
@Controller
@RequestMapping("/content/emoticon")
public class Con_EmoticonController {

    @GetMapping("/list")
    public String list() {
        return "content/emoticon/list";
    }

    @RequestMapping("/popup/category/list")
    public String popup(Model model, HttpServletRequest request) {
        return "content/emoticon/popup/categoryList";
    }
}