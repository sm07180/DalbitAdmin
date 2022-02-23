package com.dalbit.broadcast.vo.procedure;

import com.dalbit.common.vo.PagingVo;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class P_VoteListOutputVo {
    private String vote_no;         // 투표번호
    private String mem_no;          // 투표개설자 회원번호
    private String room_no;         // 투표개설 방번호
    private String vote_title;	    // 투표제목
    private String vote_end_slct;   // 투표종료구분[s:투표중, e:마감, d:투표삭제]
    private String vote_anony_yn;	// 익명투표 여부
    private String vote_dupli_yn;	// 중복투표 여부
    private int vote_mem_cnt;	    // 투표참여회원수
    private int vote_item_cnt;      // 투표항목수
    private int end_time;	        // 마감설정시간(초)
    private Date start_date;        // 투표개설 일자
    private Date end_date;          // 투표종료 일자
    private Date ins_date;          // 등록일자
    private Date upd_date;          // 변경일자
}
