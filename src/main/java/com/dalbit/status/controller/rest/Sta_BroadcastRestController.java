package com.dalbit.status.controller.rest;

import com.dalbit.status.service.Sta_BroadcastService;
import com.dalbit.status.vo.procedure.P_StatVo;
import com.dalbit.util.DalbitUtil;
import com.dalbit.util.GsonUtil;
import com.dalbit.util.MessageUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
@RequestMapping("rest/status/broadcast")
public class Sta_BroadcastRestController {

    @Autowired
    GsonUtil gsonUtil;
    @Autowired
    MessageUtil messageUtil;
    @Autowired
    Sta_BroadcastService sta_BroadcastService;

    /**
     * 방송 총계
     * @param pStatVo
     * @return
     */
    @PostMapping("info/total")
    public String infoTotal(P_StatVo pStatVo){
        if(DalbitUtil.isEmpty(pStatVo.getStartDate())){
            pStatVo.setStartDate(null);
        }

        if(DalbitUtil.isEmpty(pStatVo.getEndDate())){
            pStatVo.setEndDate(null);
        }

        String result = sta_BroadcastService.callBroadcastTotal(pStatVo);
        return result;
    }

    /**
     * 방송 플랫폼
     * @param pStatVo
     * @return
     */
    @PostMapping("info/platform")
    public String infoPlatform(P_StatVo pStatVo){
        if(DalbitUtil.isEmpty(pStatVo.getStartDate())){
            pStatVo.setStartDate(null);
        }

        if(DalbitUtil.isEmpty(pStatVo.getEndDate())){
            pStatVo.setEndDate(null);
        }

        String result = sta_BroadcastService.callBroadcastPlatform(pStatVo);
        return result;
    }

    /**
     * 방송개설된 주제
     * @param pStatVo
     * @return
     */
    @PostMapping("info/subject/create")
    public String infoSubjectCreate(P_StatVo pStatVo){
        if(DalbitUtil.isEmpty(pStatVo.getStartDate())){
            pStatVo.setStartDate(null);
        }

        if(DalbitUtil.isEmpty(pStatVo.getEndDate())){
            pStatVo.setEndDate(null);
        }

        String result = sta_BroadcastService.callBroadcastSubjectCreate(pStatVo);
        return result;
    }

    /**
     * 방송 고정
     */
    @PostMapping("/broadcastLive/list")
    public String broadcastLive(){
        String result = sta_BroadcastService.callBroadcastLive();
        return result;
    }

    /**
     * 방송 선물 통계 현황
     */
    @PostMapping("/broadcastGift/list")
    public String broadcastGift(P_StatVo pStatVo){
        String result = sta_BroadcastService.callBroadcastGift(pStatVo);
        return result;
    }

    /**
     * 방송 통계 현황
     */
    @PostMapping("/broadSumStatus/list")
    public String broadSumStatusList(P_StatVo pStatVo){
        String result = sta_BroadcastService.callBroadcastSumStatus(pStatVo);
        return result;
    }

}
