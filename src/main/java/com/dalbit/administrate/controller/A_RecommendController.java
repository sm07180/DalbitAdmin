package com.dalbit.administrate.controller;


import com.dalbit.administrate.service.A_RecommendService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Slf4j
@Controller
@RequestMapping("/administrate/recommend")
public class A_RecommendController {

    @Autowired
    A_RecommendService aRecommendService;

    /**
     * 리스트
     * @param model
     * @return
     */
    @GetMapping("list")
    public String list(Model model) {
        return "administrate/recommend/list";
    }
}
