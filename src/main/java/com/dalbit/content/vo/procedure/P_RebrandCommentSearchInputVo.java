package com.dalbit.content.vo.procedure;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class P_RebrandCommentSearchInputVo {
    private int slct;           // 구분 [1:회원번호, 2:아이디, 3:닉네임 ,4 :연락처]
    private String searchData;  // 검색어
    private int pageNo;         // 페이지 번호
    private int pagePerCnt;     // 페이지 당 노출 건수 (Limit)
}
