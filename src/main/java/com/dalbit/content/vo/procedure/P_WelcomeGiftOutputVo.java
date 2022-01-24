package com.dalbit.content.vo.procedure;

import lombok.Data;

import java.util.Date;

@Data
public class P_WelcomeGiftOutputVo {
    private String gift_code;       // 경품코드
    private String gift_name;       // 경품이름
    private String gift_cont;       // 경품설명
    private int gift_dal_cnt;       // 달수
    private int gift_cnt;           // 지급 수량
    private int gift_step_no;       // 단계번호
    private int gift_ord;           // 순번: 1,2,3
    private int gift_slct;          // 구분 1:dj, 2:청취자
    private String use_yn;          // 경품 사용여부[y,n]
    private int tot_ins_cnt;        // 응모받은수
    private String the_month;       // 경품사용월
    private Date ins_date;		    // 등록일자
    private Date upd_date;		    // 수정일자
    private String chrgr_name;      // 관리자명
}
