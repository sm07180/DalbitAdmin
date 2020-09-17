package com.dalbit.clip.controller.rest;

import com.dalbit.clip.service.Cli_ClipStatusService;
import com.dalbit.clip.vo.procedure.P_ClipStatusVo;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
@RequestMapping("rest/clip/status")
public class Cli_ClipStatusRestController {

    @Autowired
    GsonUtil gsonUtil;

    @Autowired
    Cli_ClipStatusService cliClipStatusService;

    /**
     * 클립 선물 현황 조회
     */
    @PostMapping("/gift")
    public String clipStatusGift(P_ClipStatusVo pClipStatusVo) {
        return cliClipStatusService.callClipStatusGift(pClipStatusVo);
    }
}
