package com.dalbit.content.controller;

import com.dalbit.content.service.AppService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Slf4j
@Controller
@RequestMapping("/content/app")
public class AppController {

    @Autowired
    AppService appService;

    @GetMapping("/list")
    public String list() {
        return "content/app/list";
    }
}
