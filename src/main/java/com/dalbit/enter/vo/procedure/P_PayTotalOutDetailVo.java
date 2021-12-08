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

    private long succCnt;
    private long succCmt;
    private long succAmt;
    private long accumAmt;

    private long fisrtCnt;
    private long firstAmt;
    private long reCnt;
    private long reAmt;
    private long tryCnt;
    private long succRate;
    private long cancCnt;
    private long cancCmt;
    private long cancAmt;
    private long failCnt;


    private long inc_succCnt;
    private long inc_succAmt;
}