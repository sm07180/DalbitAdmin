package com.dalbit.administrate.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Slf4j
@Controller
@RequestMapping("/administrate/testDalByeol")
public class Adm_TestDalByeolController {

    @GetMapping("/list")
    public String list() {
        return "administrate/testDalByeol/list";
    }

    @GetMapping("popup/resourceList")
    public String resourceList() {
        return "administrate/testDalByeol/popup/resourceList";
    }

}
