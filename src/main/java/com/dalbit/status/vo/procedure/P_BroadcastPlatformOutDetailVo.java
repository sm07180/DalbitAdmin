package com.dalbit.status.vo.procedure;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class P_BroadcastPlatformOutDetailVo {
    private String date;
    private String daily;
    private String monthly;
    private int hour;
    private int totalCreateCnt;
    private int androidCnt;
    private int iosCnt;
    private int pcCnt;
    private int totalBroadcastingTime;
    private int androidTime;
    private int iosTime;
    private int pcTime;
}



