package com.dalbit.enter.vo.procedure;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class P_PaymentTimeStateOutputVo {
    private String the_date;        // 일자
    private int the_hr;             // 시간
    private int succ_cnt;           // 결제 건
    private int succ_cmt;           // 결제 수량
    private int pay_amt;            // 결제금액
    private int try_cnt;            // 결제시도
    private int succ_rate;          // 성공률
    private int canc_cnt;           // 취소건수
    private int canc_cmt;           // 취소 수량
    private int canc_amt;           // 취소금액
    private int fail_cnt;           // 실패 건
}
