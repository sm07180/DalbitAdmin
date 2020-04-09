package com.dalbit.administrate.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Slf4j
@Controller
@RequestMapping("/administrate/testId")
public class Adm_TestIdController {

    @GetMapping("/list")
    public String list() {
        return "administrate/testId/list";
    }


}
