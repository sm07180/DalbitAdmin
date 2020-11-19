package com.dalbit.payment.controller.rest;

import com.dalbit.exception.GlobalException;
import com.dalbit.payment.dao.Pay_CancelDao;
import com.dalbit.payment.service.Pay_CancelService;
import com.dalbit.payment.vo.*;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;

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
    public String payCancelCard(Pay_CancelCardVo payCancelCardVo) throws GlobalException {

        String result = payCancelService.payCancelCard(payCancelCardVo);
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
    public int payCancelBank(Pay_CancelBankVo payCancelBankVo) throws GlobalException {

        int result = payCancelService.payCancelBank(payCancelBankVo);
        return result;
    }

    /**
     *  페이레터 결제 취소
     */
    @PostMapping("payletter")
    public int payletterCancel(Pay_CancelPayletterVo payCancelPayletterVo, HttpServletRequest request) throws GlobalException {

        int result = payCancelService.payletterCancel(payCancelPayletterVo, request);
        return result;
    }


    /**
     *  문화상품권 결제 취소
     */
    @PostMapping("gm")
    public int payCancelGm(Pay_CancelGiftVo payCancelGiftVo) throws GlobalException {

        int result = payCancelService.payCancelGm(payCancelGiftVo);
        return result;
    }


    /**
     *  게임문화상품권 결제 취소
     */
    @PostMapping("gg")
    public int payCancelGg(Pay_CancelGiftVo payCancelGiftVo) throws GlobalException {

        int result = payCancelService.payCancelGg(payCancelGiftVo);
        return result;
    }


    /**
     *  도서문화상품권 결제 취소
     */
    @PostMapping("gc")
    public int payCancelGc(Pay_CancelGiftVo payCancelGiftVo) throws GlobalException {

        int result = payCancelService.payCancelGc(payCancelGiftVo);
        return result;
    }


    /**
     *  해피머니상품권 결제 취소
     */
    @PostMapping("hm")
    public int payCancelHm(Pay_CancelGiftVo payCancelGiftVo) throws GlobalException {

        int result = payCancelService.payCancelHm(payCancelGiftVo);
        return result;
    }

}
