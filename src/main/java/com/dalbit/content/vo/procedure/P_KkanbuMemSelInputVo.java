package com.dalbit.content.vo.procedure;

import lombok.Data;

@Data
public class P_KkanbuMemSelInputVo {
    private int kkanbuNo;
    private String memNo;
    private String tabSlct;
    private int pageNo = 1;
    private int pagePerCnt = 50;
}
