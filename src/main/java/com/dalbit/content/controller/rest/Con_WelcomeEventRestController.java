package com.dalbit.content.controller.rest;

import com.dalbit.content.service.Con_WelcomeEventService;
import com.dalbit.content.vo.procedure.P_WelcomeGiftInputVo;
import com.dalbit.content.vo.procedure.P_WelcomeInputVo;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 신입회원 WELCOME 이벤트
 */
@Slf4j
@RestController
@RequestMapping("rest/content/event/welcome")
public class Con_WelcomeEventRestController {

    @Autowired
    Con_WelcomeEventService con_welcomeEventService;

    @Autowired
    GsonUtil gsonUtil;

    /**
     * 청취자 목록
     * @return
     */
    @GetMapping("/listeners")
    public String getWelcomeListeners(P_WelcomeInputVo pWelcomeInputVo) {
        if (pWelcomeInputVo.getStepNo() > 0) {
            return con_welcomeEventService.callWelcomeListenerStepList(pWelcomeInputVo);
        }
        return con_welcomeEventService.callWelcomeListenerList(pWelcomeInputVo);
    }

    /**
     * DJ 목록
     * @return
     */
    @GetMapping("/dj")
    public String getWelcomeDjs(P_WelcomeInputVo pWelcomeInputVo) {
        if (pWelcomeInputVo.getStepNo() > 0) {
            return con_welcomeEventService.callWelcomeDjStepList(pWelcomeInputVo);
        }
        return con_welcomeEventService.callWelcomeDjList(pWelcomeInputVo);
    }

    /**
     * 선물 지급완료
     * @return
     */
    @PatchMapping("/gift")
    public String modifyWelcomeGift(P_WelcomeGiftInputVo pWelcomeGiftInputVo) {
        return con_welcomeEventService.callModifyWelcomeGift(pWelcomeGiftInputVo);
    }

}
