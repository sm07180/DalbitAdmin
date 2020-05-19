package com.dalbit.payment.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Slf4j
@Controller
@RequestMapping("payment/pay")
public class Pay_PayController {

    @GetMapping("list")
    public String list() {
        return "payment/pay/list";
    }


    @GetMapping("cancel/card")
    public String cancelCard() {
        return "payment/cancel/card/cn_cancel_req";
    }

    @PostMapping("cancel/card/result")
    public String cancelCardResult() {
        return "payment/cancel/card/cn_cancel_result";
    }

}
