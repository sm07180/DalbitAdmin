package com.dalbit.broadcast.vo.procedure;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class P_PlayMakerTeamListInputVo {
    private String ordSlct;         // 정렬순서 (i:등록순, m:멤버많은순, l:평균레벨 높은순)
    private int pageNo;             // 페이지 번호
    private int pagePerCnt;         // 페이지 당 노출 건수 (Limit)
}
