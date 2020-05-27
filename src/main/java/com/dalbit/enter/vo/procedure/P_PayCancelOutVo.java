package com.dalbit.enter.vo.procedure;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class P_PayCancelOutVo {
    private int sum_totalCnt;
    private int sum_totalAmt;
    private int sum_maleCnt;
    private int sum_maleAmt;
    private int sum_femaleCnt;
    private int sum_femaleAmt;
}
