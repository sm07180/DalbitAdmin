package com.dalbit.broadcast.controller;


import com.dalbit.broadcast.service.B_ManegerService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Slf4j
@Controller
@RequestMapping("/broadcast/maneger")
public class B_ManegerController {

    @Autowired
    B_ManegerService bManegerService;

    /**
     * 매니저리스트
     * //@param model
     * @return
     */
    @GetMapping("list")
    public String list(Model model) {
        return "broadcast/maneger/list";
    }
}
