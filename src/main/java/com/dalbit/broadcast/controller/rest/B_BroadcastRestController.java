package com.dalbit.broadcast.controller.rest;


import com.dalbit.broadcast.service.B_BroadcastService;
import com.dalbit.broadcast.service.B_MemberService;
import com.dalbit.broadcast.service.B_StoryService;
import com.dalbit.broadcast.vo.*;
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
import java.util.List;

@Slf4j
@RestController
@RequestMapping("rest/broadcast/broadcast")
public class B_BroadcastRestController {

    @Autowired
    B_BroadcastService bBroadcastService;
    @Autowired
    B_MemberService bMemberService;
    @Autowired
    B_StoryService bStoryService;

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
        String result = bBroadcastService.callBroadcastTypeList(apiData);
        return result;
    }

    @PostMapping("list")
    public String getBroadcastList(HttpServletRequest request){
        BroadcastListVo apiData = new BroadcastListVo();
        apiData.setSearch((String) request.getParameter("search"));
        apiData.setDate((String) request.getParameter("date"));
        apiData.setGubun(request.getParameter("gubun"));                // 검색조건
        apiData.setType((String) request.getParameter("type"));         // subject_type
        apiData.setValue(request.getParameter("value"));                // 방송주제
        apiData.setCheckDate(request.getParameter("checkDate"));        // 기간선택 여부
        apiData.setStDate(request.getParameter("stDate").replace("-",""));
        apiData.setEdDate(request.getParameter("edDate").replace("-",""));

        String result = bBroadcastService.callBroadcastList(apiData);
        return result;
    }

    @PostMapping("info")
    public String info(HttpServletRequest request){
        BroadcastInfoVo apiData = new BroadcastInfoVo();
        log.info("roomNo" + (String) request.getParameter("roomNo"));
        apiData.setRoomNo((String) request.getParameter("roomNo"));
        String result = bBroadcastService.callBroadcastInfo(apiData);
        return result;
    }

//    /**
//     * 방송관리 청취자 정보
//     * //@param model
//     * @return
//     */
//
//    @PostMapping("broadcastHistory_detail")
//    public String broadcastHistory_detail(HttpServletRequest request){
//        BroadcastHistroyVo apiData = new BroadcastHistroyVo();
//        apiData.setRoomNo((String) request.getParameter("roomNo"));
//        apiData.setTmp((String) request.getParameter("tmp"));
//
//        List<BroadcastHistroyVo> list = null;
//        if(apiData.getTmp().equals("listener")){
//            list = bMemberService.getBroadcastHistory_detail(apiData);
//        }else if(apiData.getTmp().equals("contents")){
//            list = bStoryService.getStoryHistory_detail(apiData);
//        }
//
//        return gsonUtil.toJson(new JsonOutputVo(Status.회원정보보기_성공, list));
//    }
}
