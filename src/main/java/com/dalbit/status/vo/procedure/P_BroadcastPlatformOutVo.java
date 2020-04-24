package com.dalbit.status.vo.procedure;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class P_BroadcastPlatformOutVo {
    private int sum_totalCreateCnt;
    private int sum_androidCnt;
    private int sum_iosCnt;
    private int sum_pcCnt;
    private int sum_totalBroadcastingTime;
    private int sum_androidTime;
    private int sum_iosTime;
    private int sum_pcTime;
}