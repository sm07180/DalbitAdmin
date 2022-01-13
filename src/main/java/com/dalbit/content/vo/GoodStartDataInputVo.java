package com.dalbit.content.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class GoodStartDataInputVo {
    private String goodNo;
    private String memNo = "0"; // 0: 전체
    private String bjSlct; // bj구분 [b:일반, n:신입]
    private int pageNo;
    private int pagePerCnt;
}
