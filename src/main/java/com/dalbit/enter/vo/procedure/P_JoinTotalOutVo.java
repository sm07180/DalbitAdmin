package com.dalbit.enter.vo.procedure;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class P_JoinTotalOutVo {
    private int sum_totalCnt;
    private int sum_maleCnt;
    private int sum_femaleCnt;
    private int sum_noneCnt;
    private int sum_age10Cnt;
    private int sum_age20Cnt;
    private int sum_age30Cnt;
    private int sum_age40Cnt;
    private int sum_age50Cnt;
    private int sum_age60Cnt;

    private int inc_sum_totalCnt;
}
