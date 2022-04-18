package com.dalbit.content.vo.procedure;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class P_TeamInputVo {
    private String memNo;           // 개설자 회원번호
    private int teamNo;             // 팀번호
    private String updSlct;         // 수정구분 [ a:심볼및이름, b:소개수정 ]
    private String delSclt;         // 탈퇴구분 [ m:팀장탈퇴, t:본인탈퇴, c:관리자탈퇴, e:회원탈퇴 ]
    private String tmMemNo;         // 팀원 회원번호
    private String masterMemNo;     // 팀장 회원번호
    private String chrgrName;       // 삭제 관리자명 (관리자 삭제시)

    private String teamName;        // 팀이름
    private String teamConts;       // 팀소개내용
    private String teamMedalCode;   // 팀 메달 코드(m000 형식)
    private String teamEdgeCode;    // 팀 테두리 코드(e000 형식)
    private String teamBgCode;      // 팀 배경 코드(b000 형식)
    private String reqMemYn;        // 가입신청 허용여부
}
