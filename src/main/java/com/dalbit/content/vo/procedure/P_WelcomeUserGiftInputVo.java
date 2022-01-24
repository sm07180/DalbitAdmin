package com.dalbit.content.vo.procedure;

import lombok.Data;

import java.util.List;

@Data
public class P_WelcomeUserGiftInputVo {
    private String memNo;           // 회원번호
    private int giftSlct;           // 구분 1:dj, 2:청취자
    private String giftCode;        // 경품코드
    private String giftName;        // 경품이름
    private int stepNo;             // 단계번호
    private String chrgrName;    // 관리자명

    private List<P_WelcomeUserGiftInputVo> list;
}
