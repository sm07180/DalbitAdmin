package com.dalbit.clip.vo;

import com.dalbit.common.vo.PagingVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ClipHistoryGiftTotalVo extends PagingVo {

    /* input */

    /* output */
    private int giftTotalCnt;                   // 선물 건수
    private int giftManTotalCnt;
    private int giftFemaleTotalCnt;
    private int giftUnknownTotalCnt;

    private int giftItemTotalCnt;                   // 선물 개수
    private int giftItemManTotalCnt;
    private int giftItemFemaleTotalCnt;
    private int giftItemUnknownTotalCnt;

    private int byeolTotalCnt;                 // 받은 별수
    private int byeolManTotalCnt;
    private int byeolFemaleTotalCnt;
    private int byeolUnknownTotalCnt;

    private int dalTotalCnt;                 // 받은 달수
    private int dalManTotalCnt;
    private int dalFemaleTotalCnt;
    private int dalUnknownTotalCnt;


}
