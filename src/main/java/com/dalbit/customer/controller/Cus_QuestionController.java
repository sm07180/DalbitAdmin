package com.dalbit.customer.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Slf4j
@Controller
@RequestMapping("/customer/question")
public class Cus_QuestionController {

    /**
     * Question List
     * @param model
     * @return
     */
    @GetMapping("/list")
    public String list(Model model) {
        return "customer/question/list";
    }
}
