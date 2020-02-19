package com.dalbit.broadcast.controller.rest;


import com.dalbit.broadcast.service.B_ListenerService;
import com.dalbit.broadcast.service.B_ManegerService;
import com.dalbit.broadcast.vo.ListenerVo;
import com.dalbit.broadcast.vo.ManegerVo;
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
@RequestMapping("rest/broadcast/maneger")
public class B_ManegerRestController {

    @Autowired
    B_ManegerService bManegerService;
    @Autowired
    GsonUtil gsonUtil;

    /**
     * 방송방 청취자 리스트
     * //@param model
     * @return
     */

    @PostMapping("list")
    public String list(HttpServletRequest request){
        ManegerVo apiData = new ManegerVo();
        apiData.setRoomNo((String) request.getParameter("roomNo"));
        List<ManegerVo> list = bManegerService.getManegerHistory_detail(apiData);
        return gsonUtil.toJson(new JsonOutputVo(Status.회원정보보기_성공, list));
    }
}
