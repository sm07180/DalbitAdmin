package com.dalbit.status.vo.procedure;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class P_ItemGenderOutDetailVo {

    private String monthly;
    private String daily;
    private String date;
    private String hour;
    private int totalCnt;
    private int totalAmt;
    private int maleCnt;
    private int maleAmt;
    private int femaleCnt;
    private int femaleAmt;
    private int noneCnt;
    private int noneAmt;
}



