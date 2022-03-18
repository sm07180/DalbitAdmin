package com.dalbit.broadcast.vo.procedure;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class P_PlayMakerMemSelInputVo {
    private int searchSlct;         // 구분 [1:회원번호,2:아이디,3:닉네임]
    private String searchData;      // 검색어
}
