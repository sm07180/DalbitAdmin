package com.dalbit.common.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PagingVo extends BaseVo {

    public PagingVo(){}

    public PagingVo(String totalCnt){
        this.totalCnt = Integer.parseInt(totalCnt);
    }

    public PagingVo(int totalCnt){
        this.totalCnt = totalCnt;
    }

    public PagingVo(int totalCnt, int pageStart, int pageCnt){
        this.totalCnt = totalCnt;
        this.pageStart = pageStart;
        this.pageCnt = pageCnt;

        if(totalCnt <= 10) {
            searchStartNo=1;
            searchEndNo = totalCnt;
        } else {
            searchStartNo = (int)Math.floor((pageStart-1) / 10) * 10 +1;
            searchEndNo = searchStartNo + 10 - 1;
        }
    }

    /*output*/
    private int totalCnt;
    private String tableColumnName;
    private int orderColumnIdx;
    private String orderDir;
    private int pageStart;
    private int pageCnt;

    private int searchStartNo;
    private int searchEndNo;

}
