package com.dalbit.content.controller.rest;

import com.dalbit.content.service.Con_InviteEventService;
import com.dalbit.content.service.Con_WelcomeEventService;
import com.dalbit.content.vo.procedure.*;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * 친구초대 이벤트
 */
@Slf4j
@RestController
@RequestMapping("rest/content/event/invite")
public class Con_InviteEventRestController {

    @Autowired
    GsonUtil gsonUtil;

    @Autowired
    Con_InviteEventService con_inviteEventService;

    /**
     * 초대현황
     * @param pInviteInputVo
     * @return
     */
    @GetMapping("/state")
    public String getInviteState(P_InviteInputVo pInviteInputVo) {
        return con_inviteEventService.callInviteState(pInviteInputVo);
    }

    /**
     * 참여자목록
     * @param pInviteInputVo
     * @return
     */
    @GetMapping("/list")
    public String getInviteList(P_InviteInputVo pInviteInputVo) {
        return con_inviteEventService.callInviteList(pInviteInputVo);
    }

    /**
     * 초대목록
     * @param pInviteInputVo
     * @return
     */
    @GetMapping("/recv-list")
    public String getInviteRecvList(P_InviteInputVo pInviteInputVo) {
        return con_inviteEventService.callInviteRecvList(pInviteInputVo);
    }
}
