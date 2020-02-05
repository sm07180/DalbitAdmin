package com.dalbit.broadcast.controller;


import com.dalbit.broadcast.service.B_LikeService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Slf4j
@Controller
@RequestMapping("/broadcast/like")
public class B_LikeController {

    @Autowired
    B_LikeService bLikeService;

    /**
     * 회원리스트
     * @param model
     * @return
     */
    @GetMapping("list")
    public String list(Model model) {
        return "broadcast/like/list";
    }
}
