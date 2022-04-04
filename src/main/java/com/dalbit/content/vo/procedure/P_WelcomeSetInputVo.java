package com.dalbit.content.vo.procedure;

import lombok.Data;

@Data
public class P_WelcomeSetInputVo {
    private String setSlct;     // [y:오픈,n:숨김]
    private String chrgrName;   // 관리자명
}
