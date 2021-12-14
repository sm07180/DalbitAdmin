package com.dalbit.content.vo.procedure;

import lombok.Data;

import java.util.Date;

@Data
public class P_KkanbuMarbleListOutputVo {
    private int auto_no;                    // 고유번호
    private int gganbu_no;                  // 회차번호
    private String mem_no;                   // 회원번호
    private String mem_id;                  // 회원아이디
    private String mem_nick;                // 회원대화명
    private String mem_phone;               // 회원연락처
    private int mem_state;                  // 회원상태(1:정상3:블럭, 4:탈퇴, 5:영구정지...)
    private String ins_slct;                // 구슬주머니 획득구분[e:구슬교환, u: 1만개 사용누적, s:1만개 선물 누적]
    private int marble_pocket_cnt;          // 받은주머니수
    private int rest_marble_pocket_cnt;     // 보유주머니수
    private Date ins_date;                  // 등록일자
}
