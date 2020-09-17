package com.dalbit.clip.vo.procedure;

import com.dalbit.common.vo.BaseVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class P_ClipStatusGiftOutputVo extends BaseVo {
    private String date;
    private int hour;
    private String daily;
    private int monthly;
    private int totalGiftCnt;
    private int totalGiftAmount;
    private int maleGiftCnt;
    private int maleGiftAmount;
    private int femaleGiftCnt;
    private int femaleGiftAmount;
    private int noneGiftCnt;
    private int noneGiftAmount;
}
