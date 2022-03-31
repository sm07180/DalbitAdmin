package com.dalbit.content.vo.procedure;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class P_RebrandCollectListOutputVo {
    private int seq_no;		        // 회차 번호
    private String mem_no;		    // 회원 번호
    private int use_d_cnt;	        // 이니셜 d(사용)
    private int use_a_cnt;		    // 이니셜 a(사용)
    private int use_l_cnt;		    // 이니셜 l(사용)
    private String dalla_gubun;	    // 구분[d,a,l]
    private int ins_dalla_cnt;	    // 획득수
    private Date ins_date;		    // 등록일자
    private String mem_id;		    // 회원 아이디
    private String mem_nick;	    // 회원 닉네임
    private String mem_sex;		    // 회원성별
    private String image_profile;	// 프로필
    private int mem_level;	        // 레벨
    private int mem_state;	        // 회원상태(1:정상3:블럭, 4:탈퇴, 5:영구정지...)
    private String mem_phone;	    // 회원 폰번호
    private String mem_userid;	    // 회원 유저아이디
}
