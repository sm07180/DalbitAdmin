package com.dalbit.status.vo.procedure;

import com.dalbit.common.vo.BaseVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class P_BroadcastGiftOutVo extends BaseVo {

    private int sum_totalGiftCnt;
    private int sum_totalGiftCmt;
    private int sum_totalGiftAmount;
    private int sum_normalGiftCnt;
    private int sum_normalGiftCmt;
    private int sum_normalGiftAmount;
    private int sum_secretGiftCnt;
    private int sum_secretGiftCmt;
    private int sum_secretGiftAmount;
    private int sum_guest_normalGiftCnt;
    private int sum_guest_normalGiftCmt;
    private int sum_guest_normalGiftAmount;
    private int sum_guest_secretGiftCnt;
    private int sum_guest_secretGiftCmt;
    private int sum_guest_secretGiftAmount;

}
