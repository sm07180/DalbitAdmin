package com.dalbit.content.controller.rest;

import com.dalbit.content.service.Con_ChampionEventService;
import com.dalbit.content.vo.procedure.P_ChampionsShipVo;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;

@Slf4j
@RestController
@RequestMapping("rest/content/event/champion")
public class Con_ChampionEventRestController {

    @Autowired
    Con_ChampionEventService con_championEventService;

    @Autowired
    GsonUtil gsonUtil;

    @PostMapping("/list")
    public String callChampionList(P_ChampionsShipVo p_championsShipVo) {
        String result = con_championEventService.callChampionList(p_championsShipVo);
        return result;
    }

}