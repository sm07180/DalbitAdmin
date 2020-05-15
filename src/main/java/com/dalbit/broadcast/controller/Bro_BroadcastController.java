package com.dalbit.broadcast.controller;


import com.dalbit.broadcast.service.Bro_BroadcastService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Slf4j
@Controller
@RequestMapping("/broadcast/broadcast")
public class Bro_BroadcastController {

    @Autowired
    Bro_BroadcastService bro_broadcastService;

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

    @RequestMapping("popup/playerPopup")
    public String playerPopup(HttpServletRequest request) {
        bro_broadcastService.callBroadcastSimpleInfo(request);
        return "broadcast/broadcast/popup/playerPopup";
    }

}
