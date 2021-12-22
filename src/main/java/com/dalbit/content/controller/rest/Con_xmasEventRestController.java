package com.dalbit.content.controller.rest;

import com.dalbit.content.service.Con_djFanPrizeEventService;
import com.dalbit.content.service.Con_xmasEventService;
import com.dalbit.content.vo.procedure.*;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
@RequestMapping("rest/content/event/xmas")
public class Con_xmasEventRestController {

    @Autowired
    Con_xmasEventService con_xmasEventService;

    @Autowired
    GsonUtil gsonUtil;

    @PostMapping("/treeList")
    public String getTreeList(P_XmasTreeListInputVo treeListInputVo) {
        return con_xmasEventService.callXmasEventTreeList(treeListInputVo);
    }

    @PostMapping("/delTreeStoryList")
    public String getDelTreeStoryList(P_XmasTreeListInputVo delTreeStoryListInputVo) {
        return con_xmasEventService.callXmasEventAllDelStoryList(delTreeStoryListInputVo);
    }

    @PostMapping("/setDecoStory")
    public String setDecoStoryToTree(P_XmasTreeSetDecoStoryInputVo decoStoryInputVo) {
        return con_xmasEventService.callXmasEventSetDecoStory(decoStoryInputVo);
    }

    @PostMapping("/getReportList")
    public String getReportList(P_XmasTreeListInputVo getReportListInputVo) {
        return con_xmasEventService.callXmasEventGetReportList(getReportListInputVo);
    }

    @PostMapping("/delStory")
    public String delStory(P_XmasTreeDelStoryInputVo delStoryInputVo) {
        return con_xmasEventService.callXmasEventDelStory(delStoryInputVo);
    }

    @PostMapping("/loverList")
    public String getLoverList(P_XmasLoverListInputVo loverListInputVo) {
        return con_xmasEventService.callXmasEventGetLoverList(loverListInputVo);
    }

    @PostMapping("/getDetailLoverScoreList")
    public String getDetailLoverScoreList(P_XmasDetailLoverScoreListInputVo detailLoverScoreListInputVo) {
        return con_xmasEventService.callXmasEventGetDetailLoverScoreList(detailLoverScoreListInputVo);
    }
}
