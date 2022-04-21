package com.dalbit.menu.vo.procedure;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class P_StarInputVo {
    private String memNo;           // 회원번호
    private String tDate;           // 날짜 [0000-00-01]
    private String chrgrName;       // 관리자명
}
