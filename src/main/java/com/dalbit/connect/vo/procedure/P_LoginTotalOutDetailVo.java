package com.dalbit.connect.vo.procedure;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class P_LoginTotalOutDetailVo {

    private String daily;
    private int monthly;
    private int month;
    private String date;
    private int day;
    private int hour;
    private String week;

    private int totalCnt;
    private int maleCnt;
    private int femaleCnt;
    private int noneCnt;

}