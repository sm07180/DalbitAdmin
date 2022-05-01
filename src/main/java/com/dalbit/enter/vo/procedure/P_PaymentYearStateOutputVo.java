package com.dalbit.enter.vo.procedure;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class P_PaymentYearStateOutputVo {
    private String the_date;        // 일자
    private int succ_cnt;           // 결제 건
    private int succ_cmt;           // 결제 수량
    private int pay_amt;		    // 결제금액
    private int canc_amt;		    // 취소금액
    private int first_cnt;          // 첫구매 건수
    private int first_cmt;          // 첫구매 수량
    private int first_amt;          // 첫구매 금액
    private int re_cnt;             // 재구매 건수
    private int re_cmt;             // 재구매 수량
    private int re_amt;             // 재구매 금액
}
