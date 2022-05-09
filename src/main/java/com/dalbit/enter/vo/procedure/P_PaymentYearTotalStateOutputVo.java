package com.dalbit.enter.vo.procedure;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class P_PaymentYearTotalStateOutputVo {
    private int first_cnt;      // 첫구매건
    private int first_cmt;		// 첫구매 수량
    private int first_amt;		// 첫구매금액
    private int re_cnt;		    // 재구매건
    private int re_cmt;		    // 재구매 수량
    private int re_amt;		    // 재구매금액
}
