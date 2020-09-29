package com.dalbit.clip.controller.rest;

import com.dalbit.clip.service.Cli_ClipStatusService;
import com.dalbit.clip.vo.procedure.P_ClipStatusVo;
import com.dalbit.util.DalbitUtil;
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
     * 클립 등록 현황 조회
     */
    @PostMapping("/info/time")
    public String clipStatusInfo(P_ClipStatusVo pClipStatusVo) {
        if(DalbitUtil.isEmpty(pClipStatusVo.getStartDate())){
            pClipStatusVo.setStartDate(null);
        }

        if(DalbitUtil.isEmpty(pClipStatusVo.getEndDate())){
            pClipStatusVo.setEndDate(null);
        }

        String result = cliClipStatusService.callClipStatusTime(pClipStatusVo);
        return result;
    }

    /**
     * 클립 주제별 현황 조회
     */
    @PostMapping("/info/type")
    public String clipStatusType(P_ClipStatusVo pClipStatusVo) {
        if(DalbitUtil.isEmpty(pClipStatusVo.getStartDate())){
            pClipStatusVo.setStartDate(null);
        }

        if(DalbitUtil.isEmpty(pClipStatusVo.getEndDate())){
            pClipStatusVo.setEndDate(null);
        }

        String result = cliClipStatusService.callClipStatusType(pClipStatusVo);
        return result;
    }

    /**
     * 클립 선물 현황 조회
     */
    @PostMapping("/gift")
    public String clipStatusGift(P_ClipStatusVo pClipStatusVo) {
        return cliClipStatusService.callClipStatusGift(pClipStatusVo);
    }

    /**
     * 클립 연령별 현황 조회
     */
    @PostMapping("/info/age")
    public String clipStatusAge(P_ClipStatusVo pClipStatusVo) {
        if(DalbitUtil.isEmpty(pClipStatusVo.getStartDate())){
            pClipStatusVo.setStartDate(null);
        }

        if(DalbitUtil.isEmpty(pClipStatusVo.getEndDate())){
            pClipStatusVo.setEndDate(null);
        }

        String result = cliClipStatusService.callClipStatusAge(pClipStatusVo);
        return result;
    }


    /**
     * 클립 플랫폼 현황 조회
     */
    @PostMapping("/info/platform")
    public String clipStatusPlatform(P_ClipStatusVo pClipStatusVo) {
        if(DalbitUtil.isEmpty(pClipStatusVo.getStartDate())){
            pClipStatusVo.setStartDate(null);
        }

        if(DalbitUtil.isEmpty(pClipStatusVo.getEndDate())){
            pClipStatusVo.setEndDate(null);
        }

        String result = cliClipStatusService.callClipStatusPlatform(pClipStatusVo);
        return result;
    }

}
