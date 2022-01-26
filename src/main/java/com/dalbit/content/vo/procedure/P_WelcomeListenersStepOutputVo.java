package com.dalbit.content.vo.procedure;

import lombok.Data;

import java.util.Date;

@Data
public class P_WelcomeListenersStepOutputVo {
    private String mem_no;              // 회원 번호
    private String mem_phone;	        // 회원 폰번호
    private String mem_nick;	        // 회원 닉네임
    private Date  mem_join_date;        // 회원가입일

    private int step_no;                // 단계 번호

    private int play_time;	            // 방송시간
    private int rcv_like_cnt;	        // 받은좋아요
    private int rcv_dal_cnt;	        // 선물받은달

    private String mem_gift_req_yn;     // 경품신청 완료
    private String mem_gift_rcv_yn;     // 경품받기 완료
    private Date mem_gift_the_month;    // 경품 일자(월)
    private String mem_gift_code;       // 경품 코드
    private String mem_gift_name;       // 경품 이름
    private Date mem_gift_req_date;     // 신청날짜
    private Date mem_gift_rcv_date;	    // 받은일자
    
    private String step_con_yn;         // 접속조건 충족여부
    private int tot_pay_dal_cnt;        // 총 구매달

    private Date ins_date;		        // 등록일자
    private Date upd_date;		        // 수정일자
}
