package com.dalbit.status.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Slf4j
@Controller
@RequestMapping("/status/level")
public class Sta_LevelController {

    @GetMapping("/tab")
    public String list() {
        return "status/level/tab";
    }

    @RequestMapping("popup/memLevelList")
    public String memberPopup(Model model) { return "status/level/popup/memLevelList"; }

}
