package com.dalbit.payment.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Pay_CancelPhoneVo {

    /* Pay_CancelVo Input */
    private String mrchid;          // 상점아이디 8자리
    private String tradeid;         // 주문번호
    private String prdtprice;       // 결제금액
    private String mobilid;         // 거래번호

}
