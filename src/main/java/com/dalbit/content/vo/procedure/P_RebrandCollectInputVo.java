package com.dalbit.content.vo.procedure;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class P_RebrandCollectInputVo {
    private String memNo;           // 회원번호
    private String dallaGubun;      // 구분[d,a,l]
    private int insDallaCnt;        // 받은 이니셜 값
    private String chrgrMemName;    // 관리자명
    private int insDallaSlct;       // 1:지급 / 2:차감
}
