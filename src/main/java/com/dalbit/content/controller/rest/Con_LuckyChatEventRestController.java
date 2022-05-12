package com.dalbit.content.controller.rest;

import com.dalbit.content.service.Con_LuckyChatEventService;
import com.dalbit.content.vo.procedure.P_LuckyChatInputVo;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
@RequestMapping("rest/content/event/luck-chat")
public class Con_LuckyChatEventRestController {

    @Autowired
    GsonUtil gsonUtil;

    @Autowired
    Con_LuckyChatEventService con_luckyChatEventService;

    /**
     * 중복회원
     *
     * @param pLuckyChatInputVo
     * @return
     */
    @GetMapping("/duplicat")
    public String getDuplicat(P_LuckyChatInputVo pLuckyChatInputVo) {
        return con_luckyChatEventService.getDuplicat(pLuckyChatInputVo);
    }

    /**
     * 당첨목록
     *
     * @param pLuckyChatInputVo
     * @return
     */
    @GetMapping("/list")
    public String getChatMemList(P_LuckyChatInputVo pLuckyChatInputVo) {
        return con_luckyChatEventService.getChatMemList(pLuckyChatInputVo);
    }

    /**
     * 보너스 목록
     *
     * @param pLuckyChatInputVo
     * @return
     */
    @GetMapping("/bouns")
    public String getBouns(P_LuckyChatInputVo pLuckyChatInputVo) {
        return con_luckyChatEventService.getBouns(pLuckyChatInputVo);
    }

    /**
     * 채팅 내역
     *
     * @param pLuckyChatInputVo
     * @return
     */
    @GetMapping("/chat")
    public String getChats(P_LuckyChatInputVo pLuckyChatInputVo) {
        return con_luckyChatEventService.getChats(pLuckyChatInputVo);
    }
}
