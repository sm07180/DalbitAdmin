package com.dalbit.status.vo.procedure;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class P_BroadcastTotalOutDetailVo {
    private int date;
    private int hour;
    private int monthly;
    private int createCnt;
    private int broadcastingTime;
    private int djCnt;
    private int listenerCnt;
    private int guestCnt;
    private int giftCnt;
    private int giftAmount;
    private int daily;
}



