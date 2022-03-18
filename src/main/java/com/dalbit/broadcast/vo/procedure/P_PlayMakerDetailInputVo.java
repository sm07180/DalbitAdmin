package com.dalbit.broadcast.vo.procedure;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class P_PlayMakerDetailInputVo {
    private int teamNo;             // 팀번호
    private String ordSlct;         // 정렬순서 (b:받은별 높은순, s:선물한 회원많은순, p:방송시간많은순)
    private String tDate;             // 검색일자
    private int pageNo;             // 페이지 번호
    private int pagePerCnt;         // 페이지 당 노출 건수 (Limit)
}
