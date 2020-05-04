package com.dalbit.connect.vo.procedure;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class P_LoginBrowserOutDetailVo {

    private String date;
    private String year;
    private String month;
    private String day;
    private String hour;
    private int totalCnt;
    private int androidCnt;
    private int iosCnt;
    private int pcCnt;
}