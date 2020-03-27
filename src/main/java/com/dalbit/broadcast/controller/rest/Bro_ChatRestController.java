package com.dalbit.broadcast.controller.rest;


import com.dalbit.broadcast.service.Bro_ChatService;
import com.dalbit.broadcast.vo.procedure.P_ChatListInputVo;
import com.dalbit.broadcast.vo.procedure.P_ChatTargetListInputVo;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
@RequestMapping("rest/broadcast/chat")
public class Bro_ChatRestController {

    @Autowired
    Bro_ChatService bro_ChatService;

    @Autowired
    GsonUtil gsonUtil;

    /**
     * 생방송 채팅 목록
     */
    @PostMapping("list")
    public String list(P_ChatListInputVo pChatListInputVo){
        return bro_ChatService.getChatList(pChatListInputVo);
    }

    /**
     * 생방송 회원 채팅 목록
     */
    @PostMapping("targetList")
    public String targetList(P_ChatTargetListInputVo pChatTargetListInputVo){
        return bro_ChatService.getChatTargetList(pChatTargetListInputVo);
    }

}
