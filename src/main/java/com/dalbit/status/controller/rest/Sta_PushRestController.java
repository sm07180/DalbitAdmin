package com.dalbit.status.controller.rest;

import com.dalbit.status.service.Sta_PushService;
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
@RequestMapping("rest/status/push")
public class Sta_PushRestController {

    @Autowired
    GsonUtil gsonUtil;

    @Autowired
    MessageUtil messageUtil;

    @Autowired
    Sta_PushService sta_PushService;

    /**
     * push발송현황
     * @param pStatVo
     * @return
     */
    @PostMapping("total")
    public String total(P_StatVo pStatVo){
        if(DalbitUtil.isEmpty(pStatVo.getStartDate())){
            pStatVo.setStartDate(null);
        }
        if(DalbitUtil.isEmpty(pStatVo.getEndDate())){
            pStatVo.setEndDate(null);
        }
        String result = sta_PushService.callPushTotal(pStatVo);
        return result;
    }


    /**
     * 알림설정 현황
     * @param pStatVo
     * @return
     */
    @PostMapping("notice")
    public String notice(P_StatVo pStatVo){
        if(DalbitUtil.isEmpty(pStatVo.getStartDate())){
            pStatVo.setStartDate(null);
        }
        if(DalbitUtil.isEmpty(pStatVo.getEndDate())){
            pStatVo.setEndDate(null);
        }
        String result = sta_PushService.callNotice(pStatVo);
        return result;
    }

}
