package com.dalbit.money.vo.procedure;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class P_memberBoostStatInputVo {
    private int slctType;
    private String startDate;
    private String endDate;
    private int pageNo = 0;
    private int pageCnt = 1000;
    private int searchType;
    private int searchText;
}
