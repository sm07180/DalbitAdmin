package com.dalbit.customer.controller.rest;

import com.dalbit.customer.service.Cus_SmsService;
import com.dalbit.customer.vo.SmsVo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
@RequestMapping("rest/customer/sms")
public class Cus_SmsRestController {

    @Autowired
    Cus_SmsService cusSmsService;

    /**
     * sms 리스트 조회
     */
    @PostMapping("list")
    public String getSmsList(SmsVo smsVo) {
        String result = cusSmsService.getSmsList(smsVo);
        return result;
    }
}
