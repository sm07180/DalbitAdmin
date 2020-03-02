package com.dalbit.menu.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Slf4j
@Controller
@RequestMapping("menu/rank")
public class RankController {

    @RequestMapping("djRankList")
    public String djRankList(){
        return "menu/rank/djRankList";
    }

    @RequestMapping("fanRankList")
    public String fanRankList(){
        return "menu/rank/fanRankList";
    }
}
