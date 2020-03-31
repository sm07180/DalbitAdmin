package com.dalbit.broadcast.controller.rest;


import com.dalbit.broadcast.service.Bro_ListenerService;
import com.dalbit.broadcast.vo.procedure.P_ListenForceLeaveVo;
import com.dalbit.broadcast.vo.procedure.P_ListenListInputVo;
import com.dalbit.socket.service.SocketService;
import com.dalbit.util.GsonUtil;
import com.dalbit.util.JwtUtil;
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
    @Autowired
    SocketService socketService;
    @Autowired
    JwtUtil jwtUtil;

    /**
     * 방송방 청취자 리스트
     * //@param model
     * @return
     */

    @PostMapping("list")
    public String list(P_ListenListInputVo pListenListInputVo){
        return bro_ListenerService.getListenerList(pListenListInputVo);
    }

    @PostMapping("forceLeave")
    public String getForcedLeave(P_ListenForceLeaveVo pListenForceLeaveVo){

        socketService.kickout(pListenForceLeaveVo.getRoom_no(),"11584609206454",pListenForceLeaveVo.getMem_no(),jwtUtil.generateToken(pListenForceLeaveVo.getMem_no(), true),true);

        return bro_ListenerService.getListenerForceLeave(pListenForceLeaveVo);
    }
}
