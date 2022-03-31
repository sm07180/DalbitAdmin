package com.dalbit.broadcast.vo.procedure;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class P_PlayMakerTeamSelOutputVo {
    private int team_no;            // 팀번호
    private String team_name;       // 팀이름
    private String mem_no;          // 회원번호
    private String mem_userid;      // 회원아이디
    private String mem_nick;        // 회원대화명
    private String team_oner_yn;    // 팀장여부
    private String chrgr_name;      // 관리자명
    private Date ins_date;          // 등록일자
    private Date upd_date;          // 수정일자
}
