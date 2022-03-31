package com.dalbit.content.vo.procedure;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class P_RebrandCollectSearchInputVo {
    private String memId;           // 회원아이디
    private String memNo;           // 회원번호
    private int seqNo;              // 회차
    private int pageNo;             // 페이지 번호
    private int pagePerCnt;         // 페이지 당 노출 건수 (Limit)
}
