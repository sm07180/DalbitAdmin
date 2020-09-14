package com.dalbit.customer.vo.procedure;

import com.dalbit.common.vo.SearchVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class P_WithdrawalListOutputVo extends SearchVo {

    private String mem_no;			// 회원번호
    private String mem_nick;		// 닉네임
    private String mem_sex;			// 성별
    private int mem_age;			// 나이
    private String sanctions_cnt;	// 제재횟수
    private String op_code;			// 회원상태	(1:정상,2:경고,3:1일정지,4:3일정지,5:7일정지,6:영구정지,7:강제탈퇴)
    private String op_etc;			// 회원 신고내용
    private String status;			// member_report 신고 처리 상태 ( 0: 미처리, 1: 처리완료, 2: 운영자제재 )
    private String mem_state;		// member_basic 상태 (1:정상, 3:블록,4:탈퇴, 5: 영구블럭…)
    private String op_name;			// 처리자
    private String reason;			// 정지사유 ( 1: 프로필사진, 2: 음란성, 3: 광고 및 상업성, 4: 욕설 및 비방성, 5: 기타, 98: 관리자신고 )
    private String op_msg;			// 조치사항
    private String device_uuid;		// 디바이스 UUID
    private String mem_phone;		// 연락처
    private String start_date;		// 시작일자
    private String end_date;		// 종료일자

    private String mem_birth_year;  // 회원 생년월일
    private String mem_birth_month; // 회원 생년월일
    private String mem_birth_day;   // 회원 생년월일

    private int inner;

}
