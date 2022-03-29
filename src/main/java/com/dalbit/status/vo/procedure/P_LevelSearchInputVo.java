package com.dalbit.status.vo.procedure;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class P_LevelSearchInputVo {
    private String lastLoginYn;     // 2주간 접속회원 [y,n]
    private String chrgrYn;         // 테스트 아이디 [y :포함,n: 제외 ]
    private int levelSlct;          // 레벨구분[0:0레벨, 1:1~10, 2:11~20, 3:21~30,,4:31~40,,5:41~50,,6:51~60,,7:61~70,8:71~120] 8디폴트
    private String searchVal;       // 검색 내용
    private int searchSlct;         // 검색구분[1:회원번호, 2:회원닉네임, 3:이름, 4:연락처,5:아이디,6:IP,7:모바일ID]
    private int pageNo;             // 페이지 번호
    private int pageCnt;            // 페이지 당 노출 건수 (Limit)
}
