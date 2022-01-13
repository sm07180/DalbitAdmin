package com.dalbit.content.controller.rest;

import com.dalbit.content.service.Con_ToTheMoonEventService;
import com.dalbit.content.vo.procedure.P_ToTheMoonInputVo;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 달나라 갈끄니까? 이벤트
 */
@Slf4j
@RestController
@RequestMapping("rest/content/event/tothemoon")
public class Con_ToTheMoonEventRestController {

    @Autowired
    Con_ToTheMoonEventService con_ToTheMoonEventService;

    @Autowired
    GsonUtil gsonUtil;

    /**
     * 캐릭터보상 목록
     * @return
     */
    @GetMapping("/list")
    public String getList(P_ToTheMoonInputVo pToTheMoonInputVo) {
        return con_ToTheMoonEventService.callToTheMoonList(pToTheMoonInputVo);
    }
}
