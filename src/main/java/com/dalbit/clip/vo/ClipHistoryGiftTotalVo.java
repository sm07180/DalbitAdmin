package com.dalbit.clip.vo;

import com.dalbit.common.vo.PagingVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ClipHistoryGiftTotalVo extends PagingVo {

    /* input */

    /* output */
    private int giftTotalCnt;
    private int giftManTotalCnt;
    private int giftFemaleTotalCnt;
    private int giftUnknownTotalCnt;
    private int byeolTotalCnt;
    private int byeolManTotalCnt;
    private int byeolFemaleTotalCnt;
    private int byeolUnknownTotalCnt;


}
