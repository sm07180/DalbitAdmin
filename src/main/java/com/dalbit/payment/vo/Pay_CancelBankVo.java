package com.dalbit.payment.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Pay_CancelBankVo {

    /* Pay_CancelVo Input */
    private String tradeid;         // 주문번호
    private String prdtprice;       // 결제금액
    private String mobilid;         // 거래번호
    private String memno;
    private int dalcnt;

}
