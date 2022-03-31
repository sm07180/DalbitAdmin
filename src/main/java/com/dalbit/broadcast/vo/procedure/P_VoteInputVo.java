package com.dalbit.broadcast.vo.procedure;

import com.dalbit.common.vo.PagingVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class P_VoteInputVo {
    private String memNo;       // 회원번호
    private String roomNo;      // 방번호
    private String voteSlct;    // 투표리스트 구분 [s:투표중, e:마감, a:전체]
    private String voteNo;      // 투표번호
}
