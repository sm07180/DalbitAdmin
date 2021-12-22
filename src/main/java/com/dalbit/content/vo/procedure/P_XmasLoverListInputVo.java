package com.dalbit.content.vo.procedure;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class P_XmasLoverListInputVo {
    private int seqNo;  //회차번호[1,2]
    private int pageNo = 1;  //페이지 번호
    private int pagePerCnt = 30;  //페이지 당 노출 건수 (Limit)
}
