package com.dalbit.payment.controller.rest;

import com.dalbit.exception.GlobalException;
import com.dalbit.payment.dao.Pay_CancelDao;
import com.dalbit.payment.module.cnnew_v0003.CommonUtil;
import com.dalbit.payment.service.Pay_CancelService;
import com.dalbit.payment.vo.Pay_CancelBankVo;
import com.dalbit.payment.vo.Pay_CancelCardVo;
import com.dalbit.payment.vo.Pay_CancelPhoneVo;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.IOException;

@Slf4j
@RestController
@RequestMapping("/rest/payment/pay/cancel")
public class Pay_CancelRestController {

    @Autowired
    Pay_CancelService payCancelService;

    @Autowired
    Pay_CancelDao payCancelDao;

    @Autowired
    GsonUtil gsonUtil;

    /**
     *  신용카드 결제 취소
     */
    @PostMapping("card")
    public int payCancelCard(Pay_CancelCardVo payCancelCardVo) throws GlobalException {

        int result = payCancelService.payCancelCard(payCancelCardVo);
        return result;
    }

    /**
     *  휴대폰 결제 취소
     */
    @PostMapping("phone")
    public int payCancelPhone(Pay_CancelPhoneVo payCancelPhoneVo) throws GlobalException {

        int result = payCancelService.payCancelPhone(payCancelPhoneVo);
        return result;
    }

    /**
     *  실계좌이체 결제 취소
     */
    @PostMapping("bank")
    public int payBankPhone(Pay_CancelBankVo payCancelBankVo) throws GlobalException {

        int result = payCancelService.payCancelBank(payCancelBankVo);
        return result;
    }

}
