package com.dalbit.content.vo.procedure;

import lombok.Data;

import java.util.Date;

@Data
public class P_KkanbuMemSelMarbleListOutputVo {
    private int auto_no;                    // 고유번호
    private int gganbu_no;                  // 회차번호
    private String mem_no;                  // 회원번호
    private String ins_slct;                // 회원아이디
    private String chng_slct;               // 회원대화명
    private int red_marble;                 // 빨간구슬
    private int yellow_marble;		        // 노랑구슬
    private int blue_marble;                // 파랑구슬
    private int violet_marble;              // 보라구슬
    private String room_no; 	            // 획득방번호
    private Date ins_date;                  // 등록일자
}
