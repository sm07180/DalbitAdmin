package com.dalbit.content.vo.procedure;

import lombok.Data;

import java.util.List;

@Data
public class P_WelcomeQualifyInputVo {
    private String theMonth;        // 사용월[0000-00-01]
    private String qualifyName;     // 조건 이름
    private int qualifyNo;          // 조건 번호
    private int qualifyGubun;       // 조건구분[1:방송시청,2:좋아요,3:달충전] , [방송 시청:초]
    private int qualifyVal;         // 조건 값
    private int qualifyStepNo;      // 단계 번호[1,2,3]
    private int qualifySlct;        // 1:dj,2:회원
    private String chrgrName;       // 관리자명

    private List<P_WelcomeQualifyInputVo> list;

    private int stepNo;
    private String tDate;           // 경품사용월 - 조회
    private int pageNo = 1;
    private int pagePerCnt = 50;
}
