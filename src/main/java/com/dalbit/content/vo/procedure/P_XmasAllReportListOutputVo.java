package com.dalbit.content.vo.procedure;

import lombok.Data;

import java.util.Date;

@Data
public class P_XmasAllReportListOutputVo {
    private int auto_no;         //-- 자동등록 번호
    private int rpt_story_no;         //-- 사연 번호
    private int rpt_story_decoration_no;         //-- 0:기본, 1:1번노출,2:2번 노출, 3:3번노출
    private String rpt_story_conts;     //-- 스토리내용
    private Date rpt_ins_date;    //-- 등록일자
    private Date rpt_upd_date;     //-- 수정일자
    private String rpt_mem_no;         //-- 회원 번호
    private String rpt_mem_nick;     //-- 회원 닉네임
    private String mem_no;     //-- 회원 번호(신고자 )
    private String mem_nick;         //-- 회원 닉네임(신고자 )
    private Date ins_date;     //-- 등록일자

}
