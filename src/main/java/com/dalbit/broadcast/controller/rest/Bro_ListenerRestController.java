package com.dalbit.broadcast.controller.rest;


import com.dalbit.broadcast.service.Bro_ListenerService;
import com.dalbit.broadcast.vo.procedure.P_BroadcastListenListInputVo;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
@RequestMapping("rest/broadcast/listener")
public class Bro_ListenerRestController {

    @Autowired
    Bro_ListenerService bro_ListenerService;
    @Autowired
    GsonUtil gsonUtil;

    /**
     * 방송방 청취자 리스트
     * //@param model
     * @return
     */

    @PostMapping("list")
    public String getBroadcastList(P_BroadcastListenListInputVo pBroadcastListenListInputVo){
        return bro_ListenerService.getListenerHistory_detail(pBroadcastListenListInputVo);
    }
}