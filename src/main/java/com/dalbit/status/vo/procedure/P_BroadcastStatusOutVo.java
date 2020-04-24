package com.dalbit.status.vo.procedure;

import com.dalbit.common.vo.BaseVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class P_BroadcastStatusOutVo extends BaseVo {

    private int sum_createCnt;
    private int sum_broadcastingTime;
    private int sum_djCnt;
    private int sum_listenerCnt;
    private int sum_guestCnt;
    private int sum_giftCnt;
    private int sum_giftAmount;


}
