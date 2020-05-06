package com.dalbit.connect.vo.procedure;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class P_LoginAgeOutDetailVo {

    private String date;
    private String year;
    private String month;
    private String day;
    private String hour;
    private int totalCnt;
    private int age10Cnt;
    private int age20Cnt;
    private int age30Cnt;
    private int age40Cnt;
    private int age50Cnt;
    private int age60Cnt;
}