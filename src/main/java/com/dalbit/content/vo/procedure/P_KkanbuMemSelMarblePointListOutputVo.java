package com.dalbit.content.vo.procedure;

import lombok.Data;

import java.util.Date;

@Data
public class P_KkanbuMemSelMarblePointListOutputVo {
    private int auto_no;                    // 고유번호
    private int gganbu_no;                  // 회차번호
    private String mem_no;                  // 회원번호
    private String ins_slct;                // 회원아이디
    private String chng_slct;               // 회원대화명
    private int exc_marble_cnt;             // 교환시 사용구슬
    private int marble_pocket_cnt;		    // 획득 주머니수
    private int rest_marble_pocket_cnt;     // 잔여주머니수
    private Date ins_date;                  // 등록일자
}
