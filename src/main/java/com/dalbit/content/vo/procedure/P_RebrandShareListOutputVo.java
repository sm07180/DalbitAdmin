package com.dalbit.content.vo.procedure;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class P_RebrandShareListOutputVo {
    private String tail_no;             // 댓글번호
    private String tail_mem_no;         // 댓글등록회원번호
    private String tail_mem_id;         // 댓글등록회원아이디
    private String tail_mem_sex;        // 댓글등록회원성별
    private String tail_mem_ip;         // 댓글등록아이피
    private String tail_conts;          // 댓글내용
    private String login_media;         // 미디어(s,w,x)
    private Date ins_date;              // 등록일자
    private String del_yn;              // 삭제여부
    private String del_chrgr_name;      // 삭제관리자명
    private Date del_date;              // 삭제일자
    private String mem_id;              // 회원아이디
    private String mem_nick;            // 회원닉네임
    private String mem_userid;          // 회원추가아이디
    private int ptr_mem_age;            // 회원나이
    private String ptr_mem_phone;       // 연락처
    private String image_profile;       // 프로필사진경로
}
