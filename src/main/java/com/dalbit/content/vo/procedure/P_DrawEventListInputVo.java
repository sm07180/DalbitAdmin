package com.dalbit.content.vo.procedure;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class P_DrawEventListInputVo {
    private String memNo = "0";
    private int bbopgiGiftSlct = 0;
    private String startDate;
    private String endDate;
    private int pageNo = 1;
    private int pagePerCnt = 50;
}
