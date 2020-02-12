package com.dalbit.broadcast.controller.rest;


import com.dalbit.broadcast.service.B_ListenerService;
import com.dalbit.broadcast.vo.BroadcastHistroyVo;
import com.dalbit.broadcast.vo.ListenerVo;
import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Slf4j
@RestController
@RequestMapping("rest/broadcast/listen")
public class B_ListenerRestController {

    @Autowired
    B_ListenerService bListenerService;
    @Autowired
    GsonUtil gsonUtil;

    /**
     * 방송방 청취자 리스트
     * //@param model
     * @return
     */

    @PostMapping("list")
    public String list(HttpServletRequest request){
        ListenerVo apiData = new ListenerVo();
        apiData.setRoomNo((String) request.getParameter("roomNo"));
        List<ListenerVo> list = bListenerService.getListenerHistory_detail(apiData);
        return gsonUtil.toJson(new JsonOutputVo(Status.회원정보보기_성공, list));
    }
}
