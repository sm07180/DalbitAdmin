package com.dalbit.content.controller.rest;

import com.dalbit.content.service.Con_RebrandEventService;
import com.dalbit.content.vo.procedure.*;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
@RequestMapping("rest/content/event/rebrand")
public class Con_RebrandEventRestController {

    @Autowired
    GsonUtil gsonUtil;

    @Autowired
    Con_RebrandEventService con_rebrandEventService;

    /**
     * 리브랜드 이벤트 - 댓글이벤트 목록
     *
     * @param pRebrandCommentSearchInputVo
     * @return
     */
    @GetMapping("/comments")
    public String getComments(P_RebrandCommentSearchInputVo pRebrandCommentSearchInputVo) {
        return con_rebrandEventService.getComments(pRebrandCommentSearchInputVo);
    }

    /**
     * 리브랜드 이벤트 - 댓글이벤트 삭제
     *
     * @param pRebrandCommentDeleteInputVo
     * @return
     */
    @PostMapping("/comments")
    public String removeComment(P_RebrandCommentDeleteInputVo pRebrandCommentDeleteInputVo) {
        return con_rebrandEventService.removeComment(pRebrandCommentDeleteInputVo);
    }

    /**
     * 리브랜드 이벤트 - 공감 목록
     *
     * @param pRebrandShareSearchInputVo
     * @return
     */
    @GetMapping("/shares")
    public String getShares(P_RebrandShareSearchInputVo pRebrandShareSearchInputVo) {
        return con_rebrandEventService.getShares(pRebrandShareSearchInputVo);
    }

    /**
     * 회차별 순위 목록
     *
     * @param pRebrandCollectSearchInputVo
     * @return
     */
    @GetMapping("/collect-ranks")
    public String getCollectRankList(P_RebrandCollectSearchInputVo pRebrandCollectSearchInputVo) {
        return con_rebrandEventService.getCollectRankList(pRebrandCollectSearchInputVo);
    }

    /**
     * 회차별 뽑기 목록
     *
     * @param pRebrandCollectSearchInputVo
     * @return
     */
    @GetMapping("/collects")
    public String getCollectList(P_RebrandCollectSearchInputVo pRebrandCollectSearchInputVo) {
        return con_rebrandEventService.getCollectList(pRebrandCollectSearchInputVo);
    }

    /**
     * 종합순위 목록
     *
     * @param pRebrandCollectSearchInputVo
     * @return
     */
    @GetMapping("/collect-totals")
    public String getCollectTotalList(P_RebrandCollectSearchInputVo pRebrandCollectSearchInputVo) {
        return con_rebrandEventService.getCollectTotalList(pRebrandCollectSearchInputVo);
    }

    /**
     * 지급목록
     *
     * @param pRebrandCollectSearchInputVo
     * @return
     */
    @GetMapping("/collect-logs")
    public String getCollectLogList(P_RebrandCollectSearchInputVo pRebrandCollectSearchInputVo) {
        return con_rebrandEventService.getCollectLogList(pRebrandCollectSearchInputVo);
    }

    /**
     * 스톤지급
     *
     * @param pRebrandCollectInputVo
     * @return
     */
    @PostMapping("/collects")
    public String createCollect(P_RebrandCollectInputVo pRebrandCollectInputVo) {
        return con_rebrandEventService.createCollect(pRebrandCollectInputVo);
    }
}
