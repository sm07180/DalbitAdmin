package com.dalbit.member.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PagingVo {

    /*input*/
    private int pageStart;
    private int pageCnt;
    private String orderColumnName;
    private int orderColumnIdx;
    private String orderDir;

    /*output*/
    private int totalCnt;
    private int rowNum;

}
