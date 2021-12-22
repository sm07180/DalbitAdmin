package com.dalbit.content.vo.procedure;

import lombok.Data;

import java.util.Date;

@Data
public class P_XmasTreeStoryListOutputVo{
    private int auto_no;         //-- 자동등록 번호
    private int story_decoration_no;         //-- 0:기본, 1:1번노출,2:2번 노출, 3:3번노출
    private String story_conts;     //-- 스토리내용
    private String mem_no;         //-- 회원 번호
    private String mem_id;     //-- 회원 아이디
    private String mem_nick;     //-- 회원 닉네임
    private String mem_sex;         //-- 회원성별
    private String image_profile;     //-- 프로필
    private int mem_level;         //-- 레벨
    private int mem_state;         //-- 회원상태(1:정상3:블럭, 4:탈퇴, 5:영구정지...)
    private Date ins_date;    //-- 등록일자
    private Date upd_date;     //-- 수정일자
    private Date decoration_date;    //-- 장식 등록일자
}
