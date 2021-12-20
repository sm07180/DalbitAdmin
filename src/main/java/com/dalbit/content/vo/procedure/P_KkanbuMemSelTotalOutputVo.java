package com.dalbit.content.vo.procedure;

import lombok.Data;

import java.util.Date;

@Data
public class P_KkanbuMemSelTotalOutputVo {
    private int gganbu_no;                  // 회차번호
    private String mem_no;                  // 회원번호 (신청자)
    private int tot_red_marble;             // 획득 빨간구슬
    private int tot_yellow_marble;		    // 획득 노랑구슬
    private int tot_blue_marble;		    // 획득 파랑구슬
    private int tot_violet_marble;		    // 획득 보라구슬
    private int tot_marble_cnt;			    // 총획득 구슬수
    private int tot_mem_view_time;		    // 청취시간
    private int tot_bj_view_time;		    // 방송시간
    private int tot_mem_pay_amt;		    // 결제금액
    private int tot_mem_exc_cnt;		    // 교환별수
    private Date ins_date;			        // 등록일자
    private Date upd_date;			        // 수정일자
}
