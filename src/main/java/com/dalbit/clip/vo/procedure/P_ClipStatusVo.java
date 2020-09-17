package com.dalbit.clip.vo.procedure;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class P_ClipStatusVo {
    private int slctType;
    private int orderType;
    private String startDate;
    private String endDate;
    private int pageNo;
    private int pageCnt;

    private String beforStartDate;
    private String beforEndDate;
}
