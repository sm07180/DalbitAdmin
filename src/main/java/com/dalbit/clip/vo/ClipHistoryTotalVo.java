package com.dalbit.clip.vo;

import com.dalbit.common.vo.PagingVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ClipHistoryTotalVo extends PagingVo {

    /* input */

    /* output */
    private int manTotalCnt;
    private int femaleTotalCnt;
    private int unknownTotalCnt;

    private int delTotalCnt;
    private int delManTotalCnt;
    private int delFemaleTotalCnt;
    private int delUnknownTotalCnt;

    private String manCnt;
    private String femaleCnt;
    private String unknownCnt;
    private String delMyselfTotalCnt;
    private String delAdminTotalCnt;
    private String delMyselfManTotalCnt;
    private String delAdminManTotalCnt;
    private String delMyselfFemaleTotalCnt;
    private String delAdminFemaleTotalCnt;
    private String delMyselfUnknownTotalCnt;
    private String delAdminUnknownTotalCnt;

    private float avgMemberOfDay;


}
