package com.dalbit.broadcast.vo.procedure;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class P_PlayMakerDetailListOutputVo {
    private String mem_no;          // 회원번호
    private String mem_userid;      // 회원아이디
    private String mem_nick;        // 회원대화명
    private int team_no;            // 팀번호
    private String team_name;       // 팀이름
    private String team_oner_yn;    // 팀장여부
    private int rcv_byeol;          // 받은별
    private int play_cnt;           // 방송횟수
    private int play_time;          // 방송시간
    private int max_play_time;      // 2시간 방송시간합
    private int view_mem_cnt;       // 시청자수(비중복)
    private int tot_view_mem_cnt;   // 시청자수(중복)
    private int view_guest_cnt;     // 시청게스트
    private int send_mem_cnt;       // 선물보낸회원수(비중복)
    private int send_mem_rate;      // sender 비율
    private int new_fan_cnt;        // 신규팬수
    private int booster_cnt;        // 받은부스터수
    private Date ins_date;          // 등록일자
    private Date upd_date;          //  수정일자
}
