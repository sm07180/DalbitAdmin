package com.dalbit.content.controller.rest;

import com.dalbit.content.service.Con_djFanPrizeEventService;
import com.dalbit.content.vo.procedure.P_DjFanPrizeDjListInputVo;
import com.dalbit.content.vo.procedure.P_DjFanPrizeFanListInputVo;
import com.dalbit.content.vo.procedure.P_DjFanPrizeFanTotalListInputVo;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
@RequestMapping("rest/content/event/djFanPrize")
public class Con_djFanPrizeEventRestController {

    @Autowired
    Con_djFanPrizeEventService con_djFanPrizeEventService;

    @Autowired
    GsonUtil gsonUtil;

    @PostMapping("/listFan")
    public String getDjFanPrizeFanList(P_DjFanPrizeFanListInputVo pDjFanPrizeFanListInputVo) {
        return con_djFanPrizeEventService.callDjFanPrizeEventFanList(pDjFanPrizeFanListInputVo);
    }

    @PostMapping("/listFanTotal")
    public String getDjFanPrizeFanTotalList(P_DjFanPrizeFanTotalListInputVo pDjFanPrizeFanTotalListInputVo) {
        return con_djFanPrizeEventService.callDjFanPrizeEventFanTotalList(pDjFanPrizeFanTotalListInputVo);
    }

    @PostMapping("/listDj")
    public String getDjFanPrizeDjList(P_DjFanPrizeDjListInputVo pDjFanPrizeDjListInputVo) {
        return con_djFanPrizeEventService.callDjFanPrizeEventDjList(pDjFanPrizeDjListInputVo);
    }

}
