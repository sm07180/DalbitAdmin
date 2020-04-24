package com.dalbit.status.vo.procedure;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class P_BroadcastDjOutDetailVo {
    private String date;
    private String daily;
    private String monthly;
    private int hour;
    private int totalCnt;
    private int maleCnt;
    private int femaleCnt;
    private int noneCnt;
    private int dj10Cnt;
    private int dj20Cnt;
    private int dj30Cnt;
    private int dj40Cnt;
    private int dj50Cnt;
    private int dj60Cnt;
}



