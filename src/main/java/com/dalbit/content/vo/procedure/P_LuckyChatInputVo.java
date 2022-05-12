package com.dalbit.content.vo.procedure;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class P_LuckyChatInputVo {
    private String memNo;           // 회원번호
    private String theDate;         // 조회일자
    private int theSeq;             // 조회회차
    private int pageNo;             // 페이지 번호
    private int pagePerCnt;         // 페이지 당 노출 건수 (Limit)
}
