package com.dalbit.enter.vo.procedure;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class P_StatVo {
    private int slctType;
    private String startDate;
    private String endDate;
    private String dateList;
    private int slctTab;

    private String beforeStartDate;
    private String beforeEndDate;
}
