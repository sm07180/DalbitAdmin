package com.dalbit.broadcast.controller;


import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Slf4j
@Controller
@RequestMapping("/broadcast/broadcast")
public class Bro_BroadcastController {

    /**
     * 생방송 목록
     * @param model
     * @return
     */
    @GetMapping("list")
    public String list(Model model) {
        return "broadcast/broadcast/list";
    }

    @RequestMapping("popup/broadcastPopup")
    public String broadcastPopup(Model model) { return "broadcast/broadcast/popup/broadcastPopup"; }

    @RequestMapping("popup/messagePopup")
    public String messagePopup(Model model) { return "broadcast/broadcast/popup/messagePopup"; }
}
