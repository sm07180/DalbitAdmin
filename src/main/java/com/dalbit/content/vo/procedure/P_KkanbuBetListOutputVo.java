package com.dalbit.content.vo.procedure;

import lombok.Data;

import java.util.Date;

@Data
public class P_KkanbuBetListOutputVo {
    private int gganbu_no;          // 회차번호
    private String mem_no;          // 회원번호 (배팅자)
    private String mem_id;          // 회원아이디 (배팅자)
    private String mem_nick;        // 회원대화명 (배팅자)
    private String mem_phone;       // 회원련락처 (배팅자)
    private int mem_state;          // 회원상태(1:정상3:블럭, 4:탈퇴, 5:영구정지...) (신청자)
    private String ptr_mem_no;         // 회원번호 (깐부)
    private String ptr_mem_id;      // 회원아이디 (깐부)
    private String ptr_mem_nick;    // 회원대화명 (깐부)
    private String ptr_mem_phone;   // 회원연락처 (깐부)
    private int ptr_mem_stat;       // 회원상태(1:정상3:블럭, 4:탈퇴, 5:영구정지...) (대상자)
    private String win_slct;        // 승패여부 [w:승, l:패]
    private String betting_slct;    // 배팅구분 [a:홀, b:짝]
    private int red_marble;	        // 배팅빨간구슬
    private int yellow_marble;      // 배팅노랑구슬
    private int blue_marble;        // 배팅파란구슬
    private int violet_marble;      // 배팅보라구슬
    private int rest_red_marble;    // 잔여빨간구슬
    private int rest_yellow_marble; // 잔여노란구슬
    private int rest_blue_marble;   // 잔여파란구슬
    private int rest_violet_marble; // 잔여보라구슬
    private Date ins_date;          // 등록일자
}
