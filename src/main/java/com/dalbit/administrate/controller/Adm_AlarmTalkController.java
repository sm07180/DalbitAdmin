package com.dalbit.administrate.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Slf4j
@Controller
@RequestMapping("/administrate/alarmtalk")
public class Adm_AlarmTalkController {

    @GetMapping("target/list")
    public String targetList() {
        return "administrate/alarmtalk/list";
    }

    @GetMapping("log/list")
    public String logList() {
        return "sample/alarmTalkLog";
    }
}
