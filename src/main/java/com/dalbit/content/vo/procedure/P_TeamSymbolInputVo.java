package com.dalbit.content.vo.procedure;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class P_TeamSymbolInputVo {
    private int autoNo;         // 고유번호
    private String symbolSlct;  // 심볼구분 [b:배경, e:테두리, m:메달]
    private String bgCode;      // 팀 배지 코드(x000 형식)
    private String bgName;      // 배지 이름
    private String bgConts;     // 배지 소개
    private String bgUrl;       // 배지 URL
    private String useYn;       // 사용여부
    private String chrgrName;   // 등록관리자
}
