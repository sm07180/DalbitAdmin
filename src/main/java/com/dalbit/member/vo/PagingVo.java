package com.dalbit.member.vo;

import com.dalbit.common.vo.BaseVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PagingVo extends BaseVo {

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
