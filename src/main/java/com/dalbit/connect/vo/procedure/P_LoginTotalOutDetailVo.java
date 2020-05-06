package com.dalbit.connect.vo.procedure;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class P_LoginTotalOutDetailVo {

    private String date;
    private String year;
    private String month;
    private String day;
    private String hour;
    private int totalCnt;
    private int maleCnt;
    private int femaleCnt;
    private int noneCnt;
}