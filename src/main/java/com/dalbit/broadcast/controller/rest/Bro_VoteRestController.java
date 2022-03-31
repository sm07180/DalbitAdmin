package com.dalbit.broadcast.controller.rest;

import com.dalbit.broadcast.service.Bro_VoteService;
import com.dalbit.broadcast.vo.procedure.P_VoteInputVo;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@Slf4j
@RestController
@RequestMapping("rest/broadcast/vote")
public class Bro_VoteRestController {

    @Autowired
    Bro_VoteService broVoteService;

    @Autowired
    GsonUtil gsonUtil;

    /**
     * 투표목록
     * @param pVoteInputVo
     * @return
     */
    @PostMapping("list")
    public String list(P_VoteInputVo pVoteInputVo) {
        return broVoteService.getVoteList(pVoteInputVo);
    }

    /**
     * 투표상세(결과)
     * @param pVoteInputVo
     * @return
     */
    @GetMapping("items")
    public String items(P_VoteInputVo pVoteInputVo) {
        return broVoteService.getVoteItemList(pVoteInputVo);
    }
}
