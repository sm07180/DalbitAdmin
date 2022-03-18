package com.dalbit.broadcast.vo.procedure;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class P_PlayMakerTeamMemInputVo {
    private int teamNo;         // 팀고유번호
    private String memNo;       // 등록회원번호
    private String memSlct;     // 팀원구분(l:팀장, m:팀원)
    private String chrgrName;   // 등록관리자
}
