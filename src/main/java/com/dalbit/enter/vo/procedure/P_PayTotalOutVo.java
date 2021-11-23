package com.dalbit.enter.vo.procedure;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class P_PayTotalOutVo {
    private long sum_succCnt;
    private long sum_succAmt;
    private long sum_succCmt;
    private long sum_firstCnt;
    private long sum_firstAmt;
    private long sum_firstCmt;
    private long sum_reCnt;
    private long sum_reAmt;
    private long sum_reCmt;
    private long sum_tryCnt;
    private long sum_succRate;
    private long sum_cancCnt;
    private long sum_cancAmt;
    private long sum_cancCmt;
    private long sum_failCnt;

    private long inc_sum_succCnt;
    private long inc_sum_succAmt;
    private long inc_sum_firstCnt;
    private long inc_sum_firstAmt;
    private long inc_sum_reCnt;
    private long inc_sum_reAmt;
    private long inc_sum_tryCnt;
    private long inc_sum_succRate;
    private long inc_sum_cancCnt;
    private long inc_sum_cancAmt;

}
