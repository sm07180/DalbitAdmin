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

    /*output*/
    private int totalCnt;

    public void setTotalCnt(int totalCnt){
        this.totalCnt = totalCnt;
    }

}
