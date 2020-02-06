package com.dalbit.administrate.controller;


import com.dalbit.administrate.service.A_StarService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Slf4j
@Controller
@RequestMapping("/administrate/star")
public class A_StarController {

    @Autowired
    A_StarService aStarService;

    /**
     * 리스트
     * @param model
     * @return
     */
    @GetMapping("list")
    public String list(Model model) {
        return "administrate/star/list";
    }
}
