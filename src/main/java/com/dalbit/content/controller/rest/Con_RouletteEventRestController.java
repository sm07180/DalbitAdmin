package com.dalbit.content.controller.rest;

import com.dalbit.content.service.Con_RouletteEventService;
import com.dalbit.content.vo.procedure.P_RouletteRateVo;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
@RequestMapping("rest/content/event/roulette")
public class Con_RouletteEventRestController {

    @Autowired
    Con_RouletteEventService con_rouletteEventService;

    @Autowired
    GsonUtil gsonUtil;

    /**
     * 선물지급관리
     */
    @PostMapping("/selectRouletteRate")
    public String selectRouletteRate() {
        String result = con_rouletteEventService.selectRouletteRate();
        return result;
    }

    /**
     * 선물지급관리
     */
    @PostMapping("/updateRouletteRate")
    public String updateRouletteRate(P_RouletteRateVo pRouletteRateVo) {
        String result = con_rouletteEventService.updateRouletteRate(pRouletteRateVo);
        return result;
    }

}