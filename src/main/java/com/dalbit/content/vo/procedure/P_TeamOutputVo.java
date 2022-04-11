package com.dalbit.content.vo.procedure;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class P_TeamOutputVo {
    private int team_no;            // 팀번호
    private String master_mem_no;   // 팀장회원번호
    private String master_mem_nick; // 팀장대화명 alias
    private String mem_nick;        // 팀장대화명
    private String team_name;       // 팀명
    private String team_conts;      // 팀소개

    private String team_medal_code; // 팀메달
    private String team_edge_code;  // 팀테두리
    private String team_bg_code;    // 팀배경

    private int team_mem_cnt;       // 팀원수
    private int team_req_mem_cnt;   // 팀 가입신청수
    private int team_ivt_mem_cnt;   // 팀 가입초대수
    private int tot_send_dal_cnt;   // 팀원 총합산 보낸달수
    private int tot_rcv_byeol_cnt;  // 팀원 총합산 받은별수
    private int tot_new_fan_cnt;    // 팀원 총합산 신규팬수
    private int tot_play_time;      // 팀원 총합산 방송시간
    private int team_tot_score;     // 팀점수
    private String req_mem_yn;      // 가입신청 허용여부
    private Date ins_date;          // 등록일자
    private Date upd_date;          // 수정일자

    private String del_slct;        // 탈퇴구분[m:본인삭제, c:관리자삭제]
    private String del_chrgr_name;  // 삭제관리자명
    private Date del_date;          // 삭제일자
}
