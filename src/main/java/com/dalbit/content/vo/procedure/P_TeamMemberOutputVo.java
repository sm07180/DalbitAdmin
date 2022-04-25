package com.dalbit.content.vo.procedure;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class P_TeamMemberOutputVo {
    private int team_no;            // 팀번호
    private String tm_mem_no;       // 팀원 회원번호
    private String tm_mem_nick;     // 팀원 대화명
    private int send_dal_cnt;       // 보낸달수
    private int rcv_byeol_cnt;      // 받은별수
    private int new_fan_cnt;        // 신규팬수
    private int play_time;          // 방송시간
    private int tm_mem_score;       // 기여도 점수
    private String team_mem_type;   // 팀 멤버 구분[m:개설자 ,t:일반멤버]
    private Date ins_date;          // 등록일자
    private Date upd_date;          // 수정일자

    private String del_slct;        // 탈퇴구분[m:팀장탈퇴, t:본인탈퇴, c:관리자탈퇴, e:회원탈퇴, d:팀삭제]
    private String del_proc_slct;   // 탈퇴구분[m:팀장탈퇴, t:본인탈퇴, c:관리자탈퇴, e:회원탈퇴, d:팀삭제]
    private String del_chrgr_name;  // 삭제관리자명
    private Date del_date;          // 삭제일자
}
