package com.dalbit.content.vo.procedure;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class P_LuckyChatMemListOuputVo {
    private Date the_date;          // 집계일자
    private int the_seq;            // 회차
    private String mem_no;          // 회원번호
    private String mem_userid;      // 회원아이디
    private String mem_sex;         // 회원성별
    private String mem_birth_year;  // 회원생년
    private String mem_id;          // 회원아이디
    private String mem_nick;        // 회원대화명
    private String mem_phone;       // 회원핸드폰번호
    private String pre_code;        // 보상코드
    private String code_name;       // 보상이름
    private String rcv_yn;          // 수령여부
    private int play_time;          // 방송시간합계 (초)
    private String one_step_rcv_yn; // 보상수령여부 (1단계)
    private Date one_step_rcv_date; // 보상수령일자 (1단계)
    private String two_step_rcv_yn; // 보상수령여부 (2단계)
    private Date two_step_rcv_date; // 보상수령일자 (2단계)
    private Date ins_date;          // 등록일자
    private Date upd_date;          // 수정일자
}
