package com.dalbit.enter.vo.procedure;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class P_PayTotalOutDetailVo {
    private String daily;
    private String monthly;
    private String date;
    private String hour;
    private int succCnt;
    private int succAmt;
    private int tryCnt;
    private int succRate;
    private int cancCnt;
    private int cancAmt;
}