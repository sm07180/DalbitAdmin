package com.dalbit.customer.controller.rest;

import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.customer.service.Cus_SendMailLogService;
import com.dalbit.payment.vo.ParentsEmailLogSelVo;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
@RequestMapping("rest/customer/send/mail/log")
public class Cus_SendMailLogRestController {
    @Autowired Cus_SendMailLogService cus_sendMailLogService;
    @Autowired GsonUtil gsonUtil;

    /**
     * 미성년자 메일 발송 내역 리스트
     */
    @PostMapping("/list")
    public String parentsAuthEmailLogSel(ParentsEmailLogSelVo parentsEmailLogSelVo) {
        return cus_sendMailLogService.parentsAuthEmailLogSel(parentsEmailLogSelVo);
    }
}
