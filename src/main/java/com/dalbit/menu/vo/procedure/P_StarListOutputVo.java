package com.dalbit.menu.vo.procedure;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class P_StarListOutputVo {
    private int req_idx;                // tb_req_special_dj의 idx
    private String mem_no;              // 회원 번호
    private Date reg_date;              // 등록일
    private String op_name;             //
    private String mem_id;              // 회원 아이디
    private String mem_userid;          // 회원유저 아이디
    private String mem_nick;            // 회원 닉네임
    private String mem_sex;             // 회원 번호
    private String mem_birth_year;      // 회원 생년
    private String mem_birth_month;     // 회원 생월
    private String mem_birth_day;       // 회원 생일
    private int inner;                  // 내부직원여부(0:일반,1:내부)
    private String image_profile;       // 회원 프로필
    private int stardj_badge;           // 스타DJ 뱃지
    private int stardj_cnt;             // 스타DJ 횟수
    private String mem_name;            // 회원 이름
    private String mem_phone;           // 회원 전화번호
    private int play_cnt;               // 방송시간
    private int byeol_cnt;              // 선물받은별수
    private int like_cnt;               // 받은 좋아요수
    private int tot_view_cnt;           // 누적 시청자수
    private int view_cnt;               // 비중복 시청자수
    private String exitYn;              // 탈퇴 [y,n]
    private int warm_cnt;               // 경고
    private int block_cnt;              // 정지
}
