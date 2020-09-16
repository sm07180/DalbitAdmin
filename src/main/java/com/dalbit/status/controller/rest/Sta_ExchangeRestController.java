package com.dalbit.status.controller.rest;

import com.dalbit.status.service.Sta_ExchangeService;
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
@RequestMapping("rest/status/exchange")
public class Sta_ExchangeRestController {

    @Autowired
    GsonUtil gsonUtil;

    @Autowired
    MessageUtil messageUtil;

    @Autowired
    Sta_ExchangeService sta_ExchangeService;

    /**
     * 환전 통합 현황 월간
     * @param pStatVo
     * @return
     */
    @PostMapping("/month")
    public String month(P_StatVo pStatVo){
        if(DalbitUtil.isEmpty(pStatVo.getStartDate())){
            pStatVo.setStartDate(null);
        }
        if(DalbitUtil.isEmpty(pStatVo.getEndDate())){
            pStatVo.setEndDate(null);
        }
        String result = sta_ExchangeService.callExchangeMonth(pStatVo);
        return result;
    }

    /**
     * 환전 통합 현황 성별
     * @param pStatVo
     * @return
     */
    @PostMapping("/gender")
    public String gender(P_StatVo pStatVo){
        if(DalbitUtil.isEmpty(pStatVo.getStartDate())){
            pStatVo.setStartDate(null);
        }
        if(DalbitUtil.isEmpty(pStatVo.getEndDate())){
            pStatVo.setEndDate(null);
        }
        String result = sta_ExchangeService.callExchangeGender(pStatVo);
        return result;
    }

    /**
     * 환전 통합 현황 주별
     * @param pStatVo
     * @return
     */
    @PostMapping("/week")
    public String week(P_StatVo pStatVo){
        if(DalbitUtil.isEmpty(pStatVo.getStartDate())){
            pStatVo.setStartDate(null);
        }
        if(DalbitUtil.isEmpty(pStatVo.getEndDate())){
            pStatVo.setEndDate(null);
        }
        String result = sta_ExchangeService.callExchangeWeek(pStatVo);
        return result;
    }
}
