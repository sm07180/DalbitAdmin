package com.dalbit.status.vo.procedure;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class P_BroadcastTotalOutVo {
    private int sum_createCnt;
    private int sum_broadcastingTime;
    private int sum_djCnt;
    private int sum_listenerCnt;
    private int sum_guestCnt;
    private int sum_giftCnt;
    private int sum_giftAmount;

    private int inc_sum_createCnt;
    private int inc_sum_broadcastingTime;
    private int inc_sum_djCnt;
    private int inc_sum_listenerCnt;
    private int inc_sum_guestCnt;
    private int inc_sum_giftCnt;
    private int inc_sum_giftAmount;
}