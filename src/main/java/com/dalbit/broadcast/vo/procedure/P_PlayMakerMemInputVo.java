package com.dalbit.broadcast.vo.procedure;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class P_PlayMakerMemInputVo {
    private int teamNo;             // 팀번호
    private String ordSlct;         // 정렬순서 (b:받은별 높은순, s:선물한 회원많은순, p:방송시간많은순)
    private String endSlct;         // 활동구분 (p:활동중,e:기간종료)
    private int pageNo;             // 페이지 번호
    private int pagePerCnt;         // 페이지 당 노출 건수 (Limit)
}
