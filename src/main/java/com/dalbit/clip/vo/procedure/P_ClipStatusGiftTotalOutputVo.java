package com.dalbit.clip.vo.procedure;

import com.dalbit.common.vo.BaseVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class P_ClipStatusGiftTotalOutputVo extends BaseVo {
    private int sum_totalGiftCnt;
    private int sum_totalGiftAmount;
    private int sum_maleGiftCnt;
    private int sum_maleGiftAmount;
    private int sum_femaleGiftCnt;
    private int sum_femaleGiftAmount;
    private int sum_noneGiftCnt;
    private int sum_noneGiftAmount;
}
