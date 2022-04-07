package com.dalbit.content.vo.procedure;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class P_MemberFeedReplyOutputVo {
    private int tail_no;            // 댓글번호
    private int parent_no;          // 부모글번호
    private String tail_mem_no;     // 회원번호(댓글)
    private String tail_conts;      // 댓글내용(댓글)
    private String mem_no;          // 회원번호
    private String feed_conts;      // 내용
    private String tail_mem_id;     // 회원 아이디(댓글)
    private String tail_mem_userid; // 회원 유저아이디(댓글)
    private String tail_mem_nick;   // 닉네임(댓글)
    private String tail_mem_sex;    // 성별(댓글)
    private int tail_mem_age;       // 나이(댓글)
    private String tail_inner;      // 관리자 여부(댓글)
    private String mem_id;          // 회원 아이디
    private String mem_userid;      // 회원 유저아이디
    private String mem_nick;        // 닉네임
    private String mem_sex;         // 성별
    private int mem_age;            // 나이
    private String inner;           // 관리자 여부
    private Date tail_ins_date;     // 등록일자(댓글)
    private Date tail_upd_date;     // 수정일자(댓글)

}
