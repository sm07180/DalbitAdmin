package com.dalbit.content.controller.rest;

import com.dalbit.content.service.Con_RebrandEventService;
import com.dalbit.content.vo.procedure.P_RebrandCommentDeleteInputVo;
import com.dalbit.content.vo.procedure.P_RebrandCommentSearchInputVo;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

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
     * @param pRebrandCommentDeleteInputVo
     * @return
     */
    @DeleteMapping("/comments")
    public String removeComment(@RequestBody P_RebrandCommentDeleteInputVo pRebrandCommentDeleteInputVo) {
        return con_rebrandEventService.removeComment(pRebrandCommentDeleteInputVo);
    }
}
