package com.dalbit.status.vo.procedure;

import com.dalbit.common.vo.BaseVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class P_BroadcastStatusOutputVo extends BaseVo {

    private String date;
    private int hour;
    private int createCnt;
    private int broadcastingTime;
    private int djCnt;
    private int listenerCnt;
    private int guestCnt;
    private int giftCnt;
    private int giftAmount;
    private String daily;


}
