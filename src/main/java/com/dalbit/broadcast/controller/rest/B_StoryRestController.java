package com.dalbit.broadcast.controller.rest;


import com.dalbit.broadcast.service.B_StoryService;
import com.dalbit.broadcast.vo.BroadcastHistroyVo;
import com.dalbit.broadcast.vo.StoryVo;
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
@RequestMapping("rest/broadcast/story")
public class B_StoryRestController {

    @Autowired
    B_StoryService bStoryService;

    @Autowired
    GsonUtil gsonUtil;

    /**
     * 사연 리스트
     * //@param model
     * @return
     */

    @PostMapping("list")
    public String list(HttpServletRequest request){
        StoryVo apiData = new StoryVo();
        apiData.setRoomNo((String) request.getParameter("roomNo"));
        List<StoryVo> list = bStoryService.getStoryHistory_detail(apiData);

        return gsonUtil.toJson(new JsonOutputVo(Status.회원정보보기_성공, list));
    }

}
