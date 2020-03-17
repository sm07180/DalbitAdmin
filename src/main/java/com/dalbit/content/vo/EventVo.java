package com.dalbit.content.vo;

import com.dalbit.common.vo.PagingVo;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class EventVo extends PagingVo {

    /* input */
    private String search;
    private String searchType;

    /* output */
    private String event_col1;
    private String event_col2;
    private String event_col3;
    private Date event_col4;
    private String event_col5;
    private Date event_col6;
    private String event_col7;

}
