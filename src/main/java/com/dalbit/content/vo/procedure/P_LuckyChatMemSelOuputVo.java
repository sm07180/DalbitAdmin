package com.dalbit.content.vo.procedure;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class P_LuckyChatMemSelOuputVo {
    private int idx;                // 고유번호
    private String mem_no;          // 회원번호
    private String mem_nick;        // 회원대화명
    private String msg;             // 회원핸드폰번호
    private Date last_upd_date;     // 마지막 수정일자
}
