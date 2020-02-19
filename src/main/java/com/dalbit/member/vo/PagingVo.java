package com.dalbit.member.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PagingVo {

    /*input*/
    private int startCnt;
    private int endCnt;

    /*output*/
    private int totalCnt;

}
