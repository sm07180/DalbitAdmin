package com.dalbit.content.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Slf4j
@Controller
@RequestMapping("/content/message")
public class Con_MessageController {

    @GetMapping("/list")
    public String list() {
        return "content/message/list";
    }

    @RequestMapping("popup/messagePopup")
    public String messagePopup(Model model) { return "content/message/popup/messagePopup"; }

}
