package com.dalbit.broadcast.controller.rest;


import com.dalbit.broadcast.service.Bro_StoryService;
import com.dalbit.broadcast.vo.procedure.P_StoryListInputVo;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
@RequestMapping("rest/broadcast/story")
public class Bro_StoryRestController {

    @Autowired
    Bro_StoryService bro_StoryService;

    @Autowired
    GsonUtil gsonUtil;

    /**
     * 생방송 사연 목록
     * //@param model
     * @return
     */
    @PostMapping("list")
    public String getBroadcastList(P_StoryListInputVo pStoryListInputVo){
        return bro_StoryService.getStoryList(pStoryListInputVo);
    }

}
