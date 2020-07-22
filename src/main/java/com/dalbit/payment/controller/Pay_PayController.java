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

    @GetMapping("ios/attemp/list")
    public String iosAttempList() {
        return "payment/log/iosAttempList";
    }

    @GetMapping("coocon/receipt/list")
    public String cooconReceiptList() {
        return "payment/log/cooconReceiptList";
    }


}
