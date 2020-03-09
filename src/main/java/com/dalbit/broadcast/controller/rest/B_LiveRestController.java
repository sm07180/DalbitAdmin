package com.dalbit.broadcast.controller.rest;


import com.dalbit.broadcast.service.B_LiveService;
import com.dalbit.broadcast.vo.LiveListVo;
import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.common.vo.PagingVo;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import lombok.var;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@Slf4j
@RestController
@RequestMapping("rest/broadcast/live")
public class B_LiveRestController {

    @Autowired
    B_LiveService bLiveService;
    @Autowired
    GsonUtil gsonUtil;

    /**
     * 생방송
     * //@param model
     * @return
     */

    @PostMapping("list")
    public String getBroadcastList(LiveListVo liveListVo){
        liveListVo.setPageCnt(15);

        List<LiveListVo> list = bLiveService.callLiveList(liveListVo);
        var pagingVo = new PagingVo(bLiveService.callLiveList_cnt(liveListVo));
        return gsonUtil.toJson(new JsonOutputVo(Status.방송기록보기성공, list, pagingVo));
    }
}
