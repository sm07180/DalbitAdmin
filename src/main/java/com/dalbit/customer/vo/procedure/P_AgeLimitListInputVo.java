package com.dalbit.customer.vo.procedure;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class P_AgeLimitListInputVo {
    private int searchSlct;
    private String certYn="";
    private String searchData;
    private int pageNo = 1;
    private int pagePerCnt = 50;
}
