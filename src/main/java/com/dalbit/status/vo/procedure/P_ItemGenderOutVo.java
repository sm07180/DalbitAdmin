package com.dalbit.status.vo.procedure;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class P_ItemGenderOutVo {
    private int sum_totalCnt;
    private int sum_totalAmt;
    private int sum_maleCnt;
    private int sum_maleAmt;
    private int sum_femaleCnt;
    private int sum_femaleAmt;
    private int sum_noneCnt;
    private int sum_noneAmt;
}