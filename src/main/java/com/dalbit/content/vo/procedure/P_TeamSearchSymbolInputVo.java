package com.dalbit.content.vo.procedure;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class P_TeamSearchSymbolInputVo {
    private String symbolSlct;  // 심볼구분 [b:배경, e:테두리, m:메달]
    private String ordSlct;     // 정렬구분 [f:선호도, c:코드순, i:갱신일순]
    private int pageNo;         // 페이지 번호
    private int pagePerCnt;     // 페이지 당 노출 건수 (Limit)
}
