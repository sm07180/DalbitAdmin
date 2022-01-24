package com.dalbit.content.vo.procedure;

import lombok.Data;

import java.util.List;

@Data
public class P_WelcomeGiftInputVo {
    private String giftCode;        // 경품코드
    private String giftName;        // 경품이름
    private String giftCont;        // 경품설명
    private int giftDalCnt;         // 달수
    private int giftOrd;            // 순번: 1,2,3
    private int giftSlct;           // 구분 1:dj, 2:청취자
    private String useYn;           // 경품 사용여부[y,n]
    private String giftTheMonth;    // 경품사용월
    private String chrgrName;       // 관리자명

    private List<P_WelcomeGiftInputVo> list;

    private int stepNo;             // 단계번호
    private String tDate;           // 경품사용월 - 조회
    private int pageNo = 1;
    private int pagePerCnt = 50;
}
