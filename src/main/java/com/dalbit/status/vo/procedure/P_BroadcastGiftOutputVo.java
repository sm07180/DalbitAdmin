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
    private int totalGiftAmount;
    private int normalGiftCnt;
    private int normalGiftAmount;
    private int secretGiftCnt;
    private int secretGiftAmount;

}
