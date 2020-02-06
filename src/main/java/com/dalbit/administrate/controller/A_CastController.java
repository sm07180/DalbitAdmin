package com.dalbit.administrate.controller;


import com.dalbit.administrate.service.A_CastService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Slf4j
@Controller
@RequestMapping("/administrate/cast")
public class A_CastController {

    @Autowired
    A_CastService aCastService;

    /**
     * 리스트
     * @param model
     * @return
     */
    @GetMapping("list")
    public String list(Model model) {
        return "administrate/cast/list";
    }
}
