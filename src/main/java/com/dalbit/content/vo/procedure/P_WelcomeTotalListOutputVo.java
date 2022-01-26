package com.dalbit.content.vo.procedure;

import lombok.Data;

import java.util.Date;

@Data
public class P_WelcomeTotalListOutputVo {
    private String mem_no;              // 회원 번호
    private String mem_phone;	        // 회원 폰번호
    private String mem_nick;	        // 회원 닉네임
    private Date  mem_join_date;        // 회원가입일

    private int tot_view_time;	        // 청취시간
    private int tot_send_like_cnt;	    // 보낸좋아요
    private int tot_pay_dal_cnt;	    // 달구매

    private String step_1_req_yn;	    // 1단계 경품신청 완료
    private Date step_1_gift_the_month; // 1단계 경품 일자(월)
    private String step_1_gift_code;	// 1단계 경품 코드
    private String step_1_gift_name;	// 1단계 경품 이름
    private Date step_1_gift_req_date;  // 1단계 신청일자

    private String step_2_req_yn;	    // 2단계 경품신청 완료
    private Date step_2_gift_the_month; // 2단계 경품 일자(월)
    private String step_2_gift_code;	// 2단계 경품 코드
    private String step_2_gift_name;	// 2단계 경품 이름
    private Date step_2_gift_req_date;  // 2단계 신청일자

    private String step_3_req_yn;	    // 3단계 경품신청 완료
    private Date step_3_gift_the_month; // 3단계 경품 일자(월)
    private String step_3_gift_code;    // 3단계 경품 코드
    private String step_3_gift_name;	// 3단계 경품 이름
    private Date step_3_gift_req_date;  // 3단계 신청일자

    private Date ins_date;		        // 등록일자
    private Date upd_date;		        // 수정일자
}
