package com.dalbit.menu.vo.procedure;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class P_PartnerListOutputVo {
    private String mem_no;		            // 회원 번호
    private int partner_dj_cnt;             // 선정횟수
    private String partner_benefit;	        // 파트너DJ 혜택
    private String chrgr_name;	            // 등록관리자
    private String mem_id;		            // 회원 아이디
    private String mem_userid;	            // 회원 유저아이디
    private String mem_nick;                // 회원 닉네임
    private String mem_sex;                 // 회원 성별
    private String mem_birth_year;          // 회원 생년
    private String mem_birth_month;         // 회원 생월
    private String mem_birth_day;           // 회원 생일
    private int inner;                      // 회원 1, 비회원 0
    private String image_profile;           // 회원 프로필
    private int partnerdj_badge;            // 파트너dj 확인
    private String mem_name;                // 회원 이름
    private String mem_phone;               // 회원 폰번호
    private int partner_dj_rcv_byeol_cnt;   // 받은별
    private int partner_dj_play_cnt;        // 방송시간(초)
    private int partner_dj_rcv_like_cnt;    // 좋아요수
    private Date ins_date;                  // 등록일자
    private Date upd_date;		            // 수정일자
    private String exitYn;		            // 탈퇴여부
    private String cancelYn;		        // 취소여부
}
