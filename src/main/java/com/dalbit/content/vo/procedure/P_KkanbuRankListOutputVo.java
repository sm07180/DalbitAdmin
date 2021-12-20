package com.dalbit.content.vo.procedure;

import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;

@Data
public class P_KkanbuRankListOutputVo {
    private int gganbu_no;                  // 회차번호
    private String mem_no;                  // 회원번호 (신청자)
    private String mem_id;                  // 회원아이디 (신청자)
    private String mem_nick;                // 회원대화명 (신청자)
    private String mem_phone;               // 회원연락처 (신청자)
    private int mem_level;                  // 회원레벨
    private int mem_state;                  // 회원상태(1:정상3:블럭, 4:탈퇴, 5:영구정지...) (신청자)
    private String ptr_mem_no;              // 회원번호 (대상자)
    private String ptr_mem_id;              // 회원아이디 (대상자)
    private String ptr_mem_nick;            // 회원대화명 (대상자)
    private String ptr_mem_phone;           // 회원연락처 (대상자)
    private int ptr_mem_level;              // 회원레벨 (대상자)
    private int ptr_mem_state;              // 회원상태(1:정상3:블럭, 4:탈퇴, 5:영구정지...) (대상자)
    private int red_marble;                 // 보유 빨간구슬
    private int yellow_marble;              // 보유 노랑구슬
    private int blue_marble;                // 보유 파란구슬
    private int violet_marble;              // 보유 보라구슬
    private BigDecimal marble_pocket_pt;    // 구슬주머니 점수
    private BigDecimal tot_marble_pocket_pt;    // 구슬주머니 점수
    private int tot_mem_view_time;		    // 총방송시간
    private int tot_bj_view_time;		    // 총청취시간
    private int tot_mem_pay_amt;			// 총결제금액
    private int tot_mem_exc_cnt;			// 총 달교환
    private BigDecimal ptr_tot_marble_pocket_pt;    // 구슬주머니 점수
    private int ptr_tot_mem_view_time;		    // 총방송시간
    private int ptr_tot_bj_view_time;		    // 총청취시간
    private int ptr_tot_mem_pay_amt;			// 총결제금액
    private int ptr_tot_mem_exc_cnt;			// 총 달교환
    private Date ins_date;			        // 등록일자
}