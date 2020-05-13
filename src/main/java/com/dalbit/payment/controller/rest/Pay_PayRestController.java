package com.dalbit.payment.controller.rest;

import com.dalbit.payment.service.Pay_PayService;
import com.dalbit.payment.vo.Pay_PayVo;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
@RequestMapping("/rest/payment/pay")
public class Pay_PayRestController {

    @Autowired
    Pay_PayService payPayService;

    @Autowired
    GsonUtil gsonUtil;

    /**
     *  결제 목록 조회
     */
    @PostMapping("list")
    public String list(Pay_PayVo payPayVo) {
        String result = payPayService.getPayList(payPayVo);
        return result;
    }

}
