package com.dalbit.enter.vo.procedure;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class P_PayTotalOutDetailVo {

    private String daily;
    private int monthly;
    private String date;
    private int day;
    private int hour;

    private int succCnt;
    private int succCmt;
    private int succAmt;
    private int accumAmt;

    private int fisrtCnt;
    private int firstAmt;
    private int reCnt;
    private int reAmt;
    private int tryCnt;
    private int succRate;
    private int cancCnt;
    private int cancCmt;


    private int inc_succCnt;
    private int inc_succAmt;
}