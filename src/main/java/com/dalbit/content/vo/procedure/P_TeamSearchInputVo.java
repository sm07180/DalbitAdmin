package com.dalbit.content.vo.procedure;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class P_TeamSearchInputVo {
    private int teamNo;         // 팀번호
    private String searchSlct;  // 검색구분 [t:팀이름,m:회원번호,n:닉네임]
    private String searchDate;  // 검색어
    private String ordSlct;     // 정렬구분 [b:별많은수,d:달많은수,i:등록순,p:방송시간많은수]
    private int pageNo;         // 페이지 번호
    private int pagePerCnt;     // 페이지 당 노출 건수 (Limit)

    private String tDate;       // 해당월의 1일
}
