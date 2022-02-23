package com.dalbit.broadcast.vo.procedure;

import com.dalbit.common.vo.PagingVo;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class P_VoteItemOutputVo {
    private String item_no;         // 투표항목번호
    private String vote_no;		    // 투표번호
    private String mem_no;		    // 투표개설자 회원번호
    private String room_no;		    // 투표개설 방번호
    private String vote_item_name;	// 투표 항목 이름
    private int vote_mem_cnt;       // 투표인원수
    private Date ins_date;          // 등록일자
    private Date upd_date;          // 변경일자
}
