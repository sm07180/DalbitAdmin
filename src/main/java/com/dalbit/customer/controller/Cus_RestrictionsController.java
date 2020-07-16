package com.dalbit.customer.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Slf4j
@Controller
@RequestMapping("/customer/restrictions")
public class Cus_RestrictionsController {

    @GetMapping("/list")
    public String list(Model model) {
        return "customer/restrictions/list";
    }

}
