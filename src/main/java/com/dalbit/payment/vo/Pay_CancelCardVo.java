package com.dalbit.payment.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Pay_CancelCardVo {

    /* Pay_CancelVo Input */
    private String tradeid;         // 주문번호
    private String mobilid;         // 거래번호
    private String prdtprice;       // 결제수단
    private String partCancelYn=""; // 부분취소여부


}
