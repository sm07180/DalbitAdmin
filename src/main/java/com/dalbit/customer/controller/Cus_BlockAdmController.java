package com.dalbit.customer.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Slf4j
@Controller
@RequestMapping("/customer/blockAdm")
public class Cus_BlockAdmController {

    @GetMapping("/list")
    public String list() {
        return "customer/blockAdm/list";
    }
}
