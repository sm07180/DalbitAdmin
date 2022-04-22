package com.dalbit.content.controller.rest;

import com.dalbit.content.service.Con_WelcomeEventService;
import com.dalbit.content.vo.procedure.*;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

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

    @GetMapping("/setting")
    public String getSetting() {
        return con_welcomeEventService.callWelcomeSetting();
    }

    @PostMapping("/setting")
    public String modifySetting(P_WelcomeSetInputVo pWelcomeSetInputVo) {
        return con_welcomeEventService.callWelcomeModifySetting(pWelcomeSetInputVo);
    }

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
    @PostMapping("/gift")
    public String modifyWelcomeGift(@RequestBody P_WelcomeUserGiftInputVo pWelcomeGiftInputVo) {
        return con_welcomeEventService.callModifyWelcomeGift(pWelcomeGiftInputVo);
    }

    /**
     * 상품 목표 목록
     * @param pWelcomeQualifyInputVo
     * @return
     */
    @GetMapping("/gift-admin-goals")
    public String getGiftAdminGoals(P_WelcomeQualifyInputVo pWelcomeQualifyInputVo) {
        return con_welcomeEventService.callGiftQualifyList(pWelcomeQualifyInputVo);
    }

    /**
     * 상품 목표 등록/수정
     * @param pWelcomeQualifyInputVo
     * @return
     */
    @PostMapping("/gift-admin-goals")
    public String createGiftAdminGoals(@RequestBody P_WelcomeQualifyInputVo pWelcomeQualifyInputVo) {
        return con_welcomeEventService.callCreateGiftAdminGoals(pWelcomeQualifyInputVo);
    }

    /**
     * 상품 목록
     * @param pWelcomeGiftInputVo
     * @return
     */
    @GetMapping("/gift-admin-sections")
    public String getGiftAdminSections(P_WelcomeGiftInputVo pWelcomeGiftInputVo) {
        return con_welcomeEventService.callGiftList(pWelcomeGiftInputVo);
    }

    /**
     * 상품 목록 등록/수정
     * @param pWelcomeGiftInputVo
     * @return
     */
    @PostMapping("/gift-admin-sections")
    public String createGiftAdminSections(@RequestBody P_WelcomeGiftInputVo pWelcomeGiftInputVo) {
        return con_welcomeEventService.callCreateGiftAdminSections(pWelcomeGiftInputVo);
    }
}
