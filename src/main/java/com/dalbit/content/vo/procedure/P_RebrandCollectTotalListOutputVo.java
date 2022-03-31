package com.dalbit.content.vo.procedure;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class P_RebrandCollectTotalListOutputVo {
    private String mem_no;              // 회원 번호
    private int ins_d_cnt;		        // 사용가능한 d 수
    private int ins_a_cnt;		        // 사용가능한 a 수
    private int ins_l_cnt;		        // 사용가능한 l 수
    private int tot_d_cnt;		        // 총 d 수
    private int tot_a_cnt;		        // 총 a 수
    private int tot_l_cnt;		        // 총 l 수
    private int dalla_cnt;		        // 달라 수
    private int view_time;	            // 청취시간
    private int play_time;		        // 방송시간
    private Date ins_date;		        // 등록일자
    private Date upd_date;		        // 수정일자
    private String mem_id;		        // 회원 아이디
    private String mem_nick;	        // 회원 닉네임
    private String mem_sex;		        // 회원성별
    private String image_profile;	    // 프로필
    private int mem_level;	            // 레벨
    private int mem_state;	            // 회원상태(1:정상3:블럭, 4:탈퇴, 5:영구정지...)
    private String mem_phone;	        // 회원 폰번호
    private String mem_userid;	        // 회원 유저아이디
}
