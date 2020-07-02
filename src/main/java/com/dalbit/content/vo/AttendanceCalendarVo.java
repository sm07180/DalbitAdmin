package com.dalbit.content.vo;

import com.dalbit.common.vo.PagingVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class AttendanceCalendarVo extends PagingVo {

    /* input */
    private String search_startDate;
    private String search_endDate;

    /* output */
    private String start_date;
    private String end_date;
    private String the_date;
    private int loginCnt;
    private int joinCnt;
    private int joinSum;
    private int expSum;
    private int dalSum;
    private int sex_man;
    private int sex_female;
    private int sex_unknown;
}
