package com.dalbit.content.vo;

import com.dalbit.common.vo.PagingVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BoardAdmStoryVo extends PagingVo {

    /* 게시글 관리 > 사연 Vo*/

    /* input */
    private String searchType;
    private String searchRadio;
    private String txt_search;
    private String start_sel;
    private String end_sel;

    /* output */
    private int idx;
    private String dj_mem_no;       // 대상 회원 멤버 번호
    private String dj_mem_nick;     // 대상 회원 닉네임
    private String dj_mem_sex;      // 대상 회원 성별
    private int dj_birth_year;      // 대상 회원 생년
    private String title;           // 대상 회원 방송제목

    private String send_mem_no;     // 보낸 회원 멤버 번호
    private String send_mem_nick;   // 보낸 회원 닉네임
    private String send_mem_sex;    // 보낸 회원 성별
    private int send_birth_year;    // 보낸 회원 생년
    private String send_date;       // 보낸 일시
    private String story_content;   // 사연 내용

}
