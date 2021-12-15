package com.dalbit.content.vo.procedure;

import lombok.Data;

@Data
public class P_KkanbuMemSelOutputVo {
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
    private int ptr_mem_level;              // 회원레벨
    private int ptr_mem_state;              // 회원상태(1:정상3:블럭, 4:탈퇴, 5:영구정지...) (대상자)
}
