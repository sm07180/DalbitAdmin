package com.dalbit.content.vo.procedure;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class P_XmasDetailLoverScoreListInputVo {
    private String memNo;  //회원번호
    private int scoreSlct;  // 0: 전체 ,1:좋아요, 2: 부스터
    private int seqNo;  //회차번호[1,2]
    private int pageNo = 1;  //페이지 번호
    private int pagePerCnt = 50;  //페이지 당 노출 건수 (Limit)
}
