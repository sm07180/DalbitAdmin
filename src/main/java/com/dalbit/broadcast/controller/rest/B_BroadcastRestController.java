package com.dalbit.broadcast.controller.rest;


import com.dalbit.broadcast.service.B_BroadcastService;
import com.dalbit.broadcast.vo.BroadcastListVo;
import com.dalbit.broadcast.vo.BroadcastTypeListVo;
import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;

@Slf4j
@RestController
@RequestMapping("rest/broadcast/broadcast")
public class B_BroadcastRestController {

    @Autowired
    B_BroadcastService bBroadcastService;

    @Autowired
    GsonUtil gsonUtil;

    /**
     * 회원리스트
     * //@param model
     * @return
     */

    @PostMapping("type")
    public String level(HttpServletRequest request){
        BroadcastTypeListVo apiData = new BroadcastTypeListVo();
        apiData.setType((String) request.getParameter("type"));
        String result = bBroadcastService.callbBroadcastTypeList(apiData);
        return result;
    }

    @PostMapping("list")
    public String getBroadcastList(HttpServletRequest request){
        BroadcastListVo apiData = new BroadcastListVo();
        apiData.setSearch((String) request.getParameter("search"));
        apiData.setDate((String) request.getParameter("date"));
        apiData.setGubun(request.getParameter("gubun"));
        apiData.setType((String) request.getParameter("type"));
        apiData.setValue(request.getParameter("value"));
        apiData.setStDate((String) request.getParameter("stDate"));
        apiData.setEdDate((String) request.getParameter("edDate"));

        String result = bBroadcastService.getBroadcastList(apiData);
        return result;
    }
}
