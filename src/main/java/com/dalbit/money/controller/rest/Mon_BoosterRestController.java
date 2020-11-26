package com.dalbit.money.controller.rest;

import com.dalbit.exception.GlobalException;
import com.dalbit.money.service.Mon_BoosterService;
import com.dalbit.money.vo.procedure.P_memberBoostHistListInputVo;
import com.dalbit.money.vo.procedure.P_memberBoostStatInputVo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
@RequestMapping("rest/money/booster")
public class Mon_BoosterRestController {

    @Autowired
    Mon_BoosterService monBoosterService;

    @PostMapping("stat")
    public String info(P_memberBoostStatInputVo pMemberBoostItemInputVo) throws GlobalException {
        String result = monBoosterService.callBoosterStat(pMemberBoostItemInputVo);
        return result;
    }

    @PostMapping("histList")
    public String histList(P_memberBoostHistListInputVo pMemberBoostHistListInputVo) throws GlobalException {
        String result = monBoosterService.callBoosterHistList(pMemberBoostHistListInputVo);
        return result;
    }
}
