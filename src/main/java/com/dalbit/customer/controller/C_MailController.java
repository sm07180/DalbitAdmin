package com.dalbit.customer.controller;

import com.dalbit.customer.service.QuestionService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Slf4j
@Controller
@RequestMapping("/customer/email")
public class C_MailController {

    @Autowired
    QuestionService questionService;

    /**
     * Question List
     * @param model
     * @return
     */
    @GetMapping("/list")
    public String list(Model model) {
        return "customer/email/list";
    }
}
