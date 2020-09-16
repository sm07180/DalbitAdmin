package com.dalbit.content.vo.procedure;

import com.dalbit.common.vo.BaseVo;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class P_EventManagementListOutputVo extends BaseVo {
    private int eventIdx;
    private String title;
    private int state;
    private int alwaysYn;
    private String startDate;
    private String endDate;
    private int viewYn;
    private int applyCnt;
    private int winnerYn;
    private int announceYn;
    private String lastUpdDate;
    private String lastOpName;
}
