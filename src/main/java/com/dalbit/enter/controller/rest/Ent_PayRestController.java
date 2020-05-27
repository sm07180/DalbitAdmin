package com.dalbit.enter.controller.rest;

import com.dalbit.enter.service.Ent_PayService;
import com.dalbit.enter.vo.procedure.P_StatVo;
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
@RequestMapping("rest/enter/pay")
public class Ent_PayRestController {

    @Autowired
    GsonUtil gsonUtil;

    @Autowired
    MessageUtil messageUtil;

    @Autowired
    Ent_PayService ent_PayService;

    @PostMapping("pay/info")
    public String payInfo(){
        String result = ent_PayService.callPayInfo();
        return result;
    }

    // 결제 현황 총계
    @PostMapping("pay/total")
    public String payTotal(P_StatVo pStatVo){
        if(DalbitUtil.isEmpty(pStatVo.getStartDate())){
            pStatVo.setStartDate(null);
        }
        if(DalbitUtil.isEmpty(pStatVo.getEndDate())){
            pStatVo.setEndDate(null);
        }
        String result = ent_PayService.callPayTotal(pStatVo);
        return result;
    }

    // 결제 현황 연령별
    @PostMapping("pay/age")
    public String payAge(P_StatVo pStatVo){
        if(DalbitUtil.isEmpty(pStatVo.getStartDate())){
            pStatVo.setStartDate(null);
        }
        if(DalbitUtil.isEmpty(pStatVo.getEndDate())){
            pStatVo.setEndDate(null);
        }
        String result = ent_PayService.callPayAge(pStatVo);
        return result;
    }

    // 결제 현황 결제 수단 별
    @PostMapping("pay/way")
    public String payWay(P_StatVo pStatVo){
        if(DalbitUtil.isEmpty(pStatVo.getStartDate())){
            pStatVo.setStartDate(null);
        }
        if(DalbitUtil.isEmpty(pStatVo.getEndDate())){
            pStatVo.setEndDate(null);
        }
        String result = ent_PayService.callPayWay(pStatVo);
        return result;
    }

    // 결제 현황 결제 상품 별
    @PostMapping("pay/code")
    public String payCode(P_StatVo pStatVo){
        if(DalbitUtil.isEmpty(pStatVo.getStartDate())){
            pStatVo.setStartDate(null);
        }
        if(DalbitUtil.isEmpty(pStatVo.getEndDate())){
            pStatVo.setEndDate(null);
        }
        String result = ent_PayService.callPayCode(pStatVo);
        return result;
    }

    // 결제 현황 취소
    @PostMapping("pay/cancel")
    public String payCancel(P_StatVo pStatVo){
        if(DalbitUtil.isEmpty(pStatVo.getStartDate())){
            pStatVo.setStartDate(null);
        }
        if(DalbitUtil.isEmpty(pStatVo.getEndDate())){
            pStatVo.setEndDate(null);
        }
        String result = ent_PayService.callPayCancel(pStatVo);
        return result;
    }
}
