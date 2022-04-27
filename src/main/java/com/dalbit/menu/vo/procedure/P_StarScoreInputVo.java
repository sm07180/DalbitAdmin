package com.dalbit.menu.vo.procedure;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class P_StarScoreInputVo {
    private String selectYear;              // 대상년도[신청/수집기간]
    private String selectMonth;             // 대상월[신청/수집기간]
    private String memNo;                   // 회원번호
    private int scoreCnt;                   // 어드민 점수
}
