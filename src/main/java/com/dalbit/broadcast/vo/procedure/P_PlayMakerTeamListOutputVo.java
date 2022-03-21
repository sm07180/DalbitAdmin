package com.dalbit.broadcast.vo.procedure;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class P_PlayMakerTeamListOutputVo {
    private int team_no;            // 팀번호
    private String team_name;       // 팀이름
    private String mem_no;          // 회원번호 (팀장)
    private String mem_userid;      // 회원아이디 (팀장)
    private String mem_nick;        // 회원대화명 (팀장)
    private int team_mem_cnt;       // 팀원수
    private int team_avg_level;     // 팀원 평균레벨
    private String chrgr_name;      // 관리자명
    private int tot_rcv_byeol;      // 팀원이 1주일간 받은별
    private int tot_play_time;      // 팀원이 1주일간 방송한시간
    private Date ins_date;          // 등록일자
    private Date upd_date;          // 수정일자
}
