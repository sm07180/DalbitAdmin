package com.dalbit.money.controller.rest;

import com.dalbit.exception.GlobalException;
import com.dalbit.money.service.Mon_ExchangeService;
import com.dalbit.money.vo.Mon_ExchangeInputVo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
@RequestMapping("rest/money/exchange")
public class Mon_ExchangeRestController {

    @Autowired
    Mon_ExchangeService monExchangeService;

    @PostMapping("list")
    public String list(Mon_ExchangeInputVo monExchangeInputVo) throws GlobalException {
        String result = monExchangeService.selectExchangeList(monExchangeInputVo);
        return result;
    }
}
