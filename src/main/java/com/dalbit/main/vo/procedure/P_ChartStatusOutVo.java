package com.dalbit.main.vo.procedure;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class P_ChartStatusOutVo {

    private String day;
    private int hour;
    private int createCnt;
    private int broadcastingTime;
    private int listenerCnt;
    private int giftCnt;
    private int giftAmount;
    private int joinCnt;
    private int withdrawalCnt;
}




