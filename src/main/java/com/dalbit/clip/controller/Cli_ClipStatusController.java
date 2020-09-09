package com.dalbit.clip.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Slf4j
@Controller
@RequestMapping("/clip/status")
public class Cli_ClipStatusController {

    @GetMapping("/list")
    public String list() {
        return "clip/status/info";
    }
}