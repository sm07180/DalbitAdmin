package com.dalbit.content.vo.procedure;

import lombok.Data;

@Data
public class P_WelcomeInputVo {
    private String memNo;
    private String tDate;
    private int stepNo;
    private int pageNo = 1;
    private int pagePerCnt = 50;
}
