package com.dalbit.status.vo.procedure;

import com.dalbit.common.vo.BaseVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class P_BroadcastGiftOutVo extends BaseVo {

    private int sum_totalGiftCnt;
    private int sum_totalGiftAmount;
    private int sum_normalGiftCnt;
    private int sum_normalGiftAmount;
    private int sum_secretGiftCnt;
    private int sum_secretGiftAmount;

}
