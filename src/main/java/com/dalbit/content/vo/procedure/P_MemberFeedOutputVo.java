package com.dalbit.content.vo.procedure;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class P_MemberFeedOutputVo {
    private int reg_no;             // 번호
    private String mem_no;          // 회원번호
    private String feed_conts;      // 내용
    private int img_cnt;            // 사진수
    private String image_path;      // 대표사진
    private int tail_cnt;           // 댓글수
    private int rcv_like_cnt;       // 좋아요수
    private String mem_id;          // 회원 아이디
    private String mem_userid;      // 회원 유저아이디
    private String mem_nick;        // 닉네임
    private String mem_sex;         // 성별
    private int mem_age;            // 나이
    private String inner;           // 관리자 여부
    private String image_profile;   // 프로필
    private String mem_name;        // 이름
    private String mem_phone;       // 폰번호
    private String exitYn;          // 탈퇴여부
    private Date ins_date;          // 등록일자
    private Date upd_date;          // 수정일자
}
