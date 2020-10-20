package com.dalbit.enter.vo.procedure;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class P_PayTotalOutVo {
    private int sum_succCnt;
    private int sum_succAmt;
    private int sum_succCmt;
    private int sum_firstCnt;
    private int sum_firstAmt;
    private int sum_firstCmt;
    private int sum_reCnt;
    private int sum_reAmt;
    private int sum_reCmt;
    private int sum_tryCnt;
    private int sum_succRate;
    private int sum_cancCnt;
    private int sum_cancAmt;
    private int sum_cancCmt;

    private int inc_sum_succCnt;
    private int inc_sum_succAmt;
    private int inc_sum_firstCnt;
    private int inc_sum_firstAmt;
    private int inc_sum_reCnt;
    private int inc_sum_reAmt;
    private int inc_sum_tryCnt;
    private int inc_sum_succRate;
    private int inc_sum_cancCnt;
    private int inc_sum_cancAmt;

}
