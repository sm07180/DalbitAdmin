package com.dalbit.content.controller.rest;

import com.dalbit.content.service.Con_drawEventService;
import com.dalbit.content.vo.procedure.P_DrawEventListInputVo;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
@RequestMapping("rest/content/event/draw")
public class Con_drawEventRestController {

    @Autowired
    Con_drawEventService con_drawDeventService;

    @Autowired
    GsonUtil gsonUtil;

    @PostMapping("/list")
    public String getDrawEventList(P_DrawEventListInputVo pDrwaEventListInputVo) {
        return con_drawDeventService.callDrawEventList(pDrwaEventListInputVo);
    }
}
