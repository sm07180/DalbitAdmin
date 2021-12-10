package com.dalbit.content.vo.procedure;

import lombok.Data;

@Data
public class P_KkanbuBetListInputVo {
    private int kkanbuNo;
    private int pageNo = 1;
    private int pagePerCnt = 50;
}
