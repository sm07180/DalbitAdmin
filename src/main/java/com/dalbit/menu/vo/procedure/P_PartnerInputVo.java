package com.dalbit.menu.vo.procedure;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class P_PartnerInputVo {
    private String tMonth;          // 0000-00-01
    private String searchVal;       // 검색 내용
    private int searchSlct;         // 검색구분[1:회원번호, 2:회원닉네임, 3:이름, 4:연락처,5:아이디,6:IP,7:모바일ID]
    private int pageNo;             // 페이지 번호
    private int pageCnt;            // 페이지 당 노출 건수 (Limit)
}
