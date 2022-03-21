package com.dalbit.broadcast.vo.procedure;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class P_PlayMakerMemSelOutputVo {
    private String mem_no;          // 회원번호
    private String mem_userid;		// 회원아이디
    private String mem_nick;		// 회원대화명
    private int team_no;			// 팀번호
    private String team_name;		// 팀이름
    private String team_oner_yn;	// 팀장여부
    private int exc_cms;			// 환전 수수료
    private Date last_play_date;	// 최근방송일자
    private int tot_rcv_byeol;		// 총받은별
    private int tot_req_money_cnt;	// 환전횟수
    private int tot_req_money;		// 환전금액
    private String end_yn;			// 종료여부
    private String chrgr_name;		// 관리자명
    private Date start_date;		// 시작일자
    private Date end_date;		    // 종료일자
    private Date ins_date;		    // 등록일자
    private Date upd_date;		    // 수정일자
}
