package com.dalbit.status.vo.procedure;

import com.dalbit.common.vo.BaseVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class P_BroadcastGiftOutputVo extends BaseVo {

    private String date;
    private int hour;
    private String daily;
    private int monthly;
    private int totalGiftCnt;
    private int totalGiftCmt;
    private int totalGiftAmount;
    private int normalGiftCnt;
    private int normalGiftCmt;
    private int normalGiftAmount;
    private int secretGiftCnt;
    private int secretGiftCmt;
    private int secretGiftAmount;
    private int guest_normalGiftCnt;
    private int guest_normalGiftCmt;
    private int guest_normalGiftAmount;
    private int guest_secretGiftCnt;
    private int guest_secretGiftCmt;
    private int guest_secretGiftAmount;

}
