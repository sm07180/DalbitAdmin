package com.dalbit.content.vo.procedure;

import lombok.Data;

import java.util.Date;

@Data
public class P_WelcomeDjStepOutputVo {
    private String mem_no;              // 회원 번호
    private String mem_phone;	        // 회원 폰번호
    private String mem_nick;	        // 회원 닉네임

    private int step_no;                // 단계 번호

    private int play_time;	            // 방송시간
    private int rcv_like_cnt;	        // 받은좋아요
    private int rcv_dal_cnt;	        // 선물받은달

    private String dj_gift_req_yn;      // 경품신청 완료
    private String dj_gift_rcv_yn;      // 경품받기 완료
    private Date dj_gift_the_month;     // 경품 일자(월)
    private int dj_gift_no;             // 경품 번호
    private String dj_gift_name;        // 경품 이름
    private Date dj_gift_req_date;      // 신청날짜
    private Date dj_gift_rcv_date;	    // 받은일자

    private Date ins_date;		        // 등록일자
    private Date upd_date;		        // 수정일자
}
