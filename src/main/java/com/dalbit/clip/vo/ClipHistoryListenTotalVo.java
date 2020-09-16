package com.dalbit.clip.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ClipHistoryListenTotalVo extends ClipHistoryTotalVo {

    /* input */

    /* output */
    private int listenTotalCnt;                   // 선물 건수
    private int listenManTotalCnt;
    private int listenFemaleTotalCnt;
    private int listenUnknownTotalCnt;


}
