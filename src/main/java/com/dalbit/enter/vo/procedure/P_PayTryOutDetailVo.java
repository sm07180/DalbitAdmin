package com.dalbit.enter.vo.procedure;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class P_PayTryOutDetailVo {

    private String daily;
    private int monthly;
    private String date;

    private int day;
    private int hour;
    private int succCnt;
    private int tryCnt;
    private int succRate;

}