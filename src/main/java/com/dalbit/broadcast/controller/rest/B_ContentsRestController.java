package com.dalbit.broadcast.controller.rest;


import com.dalbit.broadcast.service.B_BroadcastService;
import com.dalbit.broadcast.service.B_MemberService;
import com.dalbit.broadcast.service.B_StoryService;
import com.dalbit.broadcast.vo.BroadcastHistroyVo;
import com.dalbit.broadcast.vo.BroadcastInfoVo;
import com.dalbit.broadcast.vo.BroadcastListVo;
import com.dalbit.broadcast.vo.BroadcastTypeListVo;
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
@RequestMapping("rest/broadcast/contents")
public class B_ContentsRestController {

    @Autowired
    B_StoryService bStoryService;

    @Autowired
    GsonUtil gsonUtil;

    /**
     * 받은 사연 리스트
     * //@param model
     * @return
     */

    @PostMapping("list")
    public String list(HttpServletRequest request){
        BroadcastHistroyVo apiData = new BroadcastHistroyVo();
        apiData.setRoomNo((String) request.getParameter("roomNo"));
        List<BroadcastHistroyVo> list = bStoryService.getStoryHistory_detail(apiData);

        return gsonUtil.toJson(new JsonOutputVo(Status.회원정보보기_성공, list));
    }
}
