package com.dalbit.customer.vo.procedure;

import com.dalbit.common.vo.SearchVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class P_ForcedListOutputVo extends SearchVo {

    private String mem_no; 			// 강퇴회원 mem_no
    private String mem_userid; 		// 강퇴회원 mem_userid
    private String mem_nick; 		// 강퇴회원 mem_nick
    private String mem_sex; 		// 강퇴회원 mem_sex
    private String mem_birth_year;  // 회원 생년월일
    private String mem_birth_month; // 회원 생년월일
    private String mem_birth_day;   // 회원 생년월일
    private int mem_age; 		// 강퇴회원 mem_age
    private String device_token; 	// 강퇴회원 device_token
    private String mem_phone; 		// 강퇴회원 mem_phone
    private String mem_ip; 		// 강퇴회원 ip
    private String last_upd_date; 	// 강퇴일시
    private String room_no; 		// 방번호
    private String title; 			// 방 제목
    private String dj_mem_no; 		// 방송방 DJ mem_no
    private String dj_mem_userid; 	// 방송방 DJ mem_userid
    private String dj_mem_nick; 	// 방송방 DJ mem_nick
    private String dj_mem_sex; 		// 방송방 DJ mem_sex
    private String exit_cnt; 		// 방송방 퇴장 횟수
    
}
