package com.dalbit.content.vo;

import com.dalbit.common.vo.PagingVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BoardAdmFanBoardVo extends PagingVo {

    /* 게시글 관리 > 팬보드 Vo*/

    /* input */
    private String searchType;
    private String searchRadio;
    private String txt_search;
    private String start_sel;
    private String end_sel;

    /* output */
    private int idx;                    // 게시글 번호
    private int board_no;               // 게시판 번호

    private String star_image_profile;  // 대상 회원 프로필 이미지
    private String star_mem_no;         // 대상 회원 멤버 번호
    private String star_mem_nick;       // 대상 회원 닉네임
    private int star_mem_state;      // 대상 회원 상태
    private String star_mem_sex;           // 대상 회원 성별
    private int star_birth_year;     // 대상 회원 생년

    private String fan_image_profile;     // 보낸 회원 프로필 이미지
    private String fan_mem_no;            // 보낸 회원 멤버 번호
    private String fan_mem_nick;          // 보낸 회원 닉네임
    private int fan_mem_state;              // 보낸 회원 상태
    private String fan_mem_sex;             // 보낸 회원 성별
    private int fan_birth_year;           // 보낸 회원 생년

    private int status;                  // 게시글 상태
    private String last_upd_date;           // 작성 일자
    private String contents;                // 내용
    private String replyCnt;                // 댓글 개수

}