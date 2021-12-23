package com.dalbit.content.controller.rest;

import com.dalbit.content.vo.procedure.P_KkanbuListInputVo;
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
    GsonUtil gsonUtil;

    /**
     * 청취자 목록
     * @return
     */
    @GetMapping("/listeners")
    public String getWelcomeListeners() {
        return "";
    }

    /**
     * DJ 목록
     * @return
     */
    @GetMapping("/discjockeys")
    public String getWelcomeDjs() {
        return "";
    }

    /**
     * 지급완료
     * @return
     */
    @PatchMapping("/gift")
    public String modifyWelcomeGift() {
        return "";
    }

}
