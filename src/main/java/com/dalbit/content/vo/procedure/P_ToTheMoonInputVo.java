package com.dalbit.content.vo.procedure;

import lombok.Data;

@Data
public class P_ToTheMoonInputVo {
    private int moonNo;
    private String memNo;
    private int pageNo = 1;
    private int pagePerCnt = 50;
}
