package com.dalbit.enter.vo.procedure;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class P_PayCancelOutDetailVo {
    private String daily;
    private String monthly;
    private String date;
    private String hour;
    private int totalCnt;
    private int totalAmt;
    private int totalCmt;
    private int maleCnt;
    private int maleAmt;
    private int maleCmt;
    private int femaleCnt;
    private int femaleAmt;
    private int femaleCmt;
}
