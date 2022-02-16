package com.dalbit.content.vo.procedure;

import lombok.Data;

@Data
public class P_InviteInputVo {
    private String memNo;
    private String tDate;
    private String searchVal;   // 검색어
    private int searchSlct;  // 검색유형 (1:회원번호, 2:회원닉네임)
    private int pageNo = 1;
    private int pagePerCnt = 50;
}
