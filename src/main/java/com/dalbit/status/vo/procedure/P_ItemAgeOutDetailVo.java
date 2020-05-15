package com.dalbit.status.vo.procedure;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class P_ItemAgeOutDetailVo {

    private String monthly;
    private String daily;
    private String date;
    private String hour;
    private int totalCnt;
    private int totalAmt;
    private int age10Cnt;
    private int age10Amt;
    private int age20Cnt;
    private int age20Amt;
    private int age30Cnt;
    private int age30Amt;
    private int age40Cnt;
    private int age40Amt;
    private int age50Cnt;
    private int age50Amt;
    private int age60Cnt;
    private int age60Amt;

}



