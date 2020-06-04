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
    private int sum_firstCnt;
    private int sum_firstAmt;
    private int sum_reCnt;
    private int sum_reAmt;
    private int sum_tryCnt;
    private int sum_succRate;
    private int sum_cancCnt;
    private int sum_cancAmt;

}
