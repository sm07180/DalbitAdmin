package com.dalbit.enter.vo.procedure;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class P_PayWayOutDetailVo {
    private String daily;
    private String monthly;
    private String date;
    private String hour;
    private int totalCnt;
    private int totalAmt;
    private int mcCnt;
    private int mcAmt;
    private int cnCnt;
    private int cnAmt;
    private int inappCnt;
    private int inappAmt;
    private int raCnt;
    private int raAmt;
    private int vaCnt;
    private int vaAmt;
}