package com.dalbit.content.vo.procedure;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class P_TeamBadgeInputVo {
    private int autoNo;             // 고유번호
    private String bgCode;          // 팀 배지 코드(x000 형식)
    private String bgName;          // 배지 이름
    private String bgConts;         // 배지 소개
    private String bgColorUrl;      // 배지 URL (획득)
    private String bgBlackUrl;      // 배지 URL (미획득)
    private int bgBonus;            // 배지획득 보상경험치
    private String useYn;           // 사용여부
    private String chrgrName;       // 등록관리자
}
