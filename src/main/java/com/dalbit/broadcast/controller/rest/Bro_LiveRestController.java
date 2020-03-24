package com.dalbit.broadcast.controller.rest;


import com.dalbit.broadcast.service.Bro_LiveService;
import com.dalbit.broadcast.vo.procedure.P_LiveListInputVo;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
@RequestMapping("rest/broadcast/live")
public class Bro_LiveRestController {

    @Autowired
    Bro_LiveService bro_LiveService;
    @Autowired
    GsonUtil gsonUtil;

    /**
     * 실시간 최신 생방송
     */
    @PostMapping("list")
    public String getBroadcastList(P_LiveListInputVo pLiveListInputVo){
        String result = bro_LiveService.callLiveList(pLiveListInputVo);
        return result;
    }
}
