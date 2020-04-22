package com.dalbit.customer.controller;

import com.dalbit.customer.service.DeclarationService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Slf4j
@Controller
@RequestMapping("/customer/image")
public class Cus_ImageController {

    @Autowired
    DeclarationService declarationService;

    /**
     * profile List
     * @param model
     * @return
     */
    @GetMapping("/list")
    public String list(Model model) {
        return "customer/image/list";
    }
}