package com.dalbit.money.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Mon_EnableSummaryVo {

    private int count;

    private long general;
    private long generalAmt;

    private long special;
    private long specialAmt;

    private long totalAmt;

    //search
    private int search_testId;
    private String search_exchangeYn;

}
