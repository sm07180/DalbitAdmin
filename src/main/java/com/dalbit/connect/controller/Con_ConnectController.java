package com.dalbit.connect.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Slf4j
@Controller
@RequestMapping("/connect/connect")
public class Con_ConnectController {

    @GetMapping("/info")
    public String list() {
        return "connect/connect/info";
    }


}
