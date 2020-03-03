package com.dalbit.content.vo;

import com.dalbit.member.vo.PagingVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class NoticeVo extends PagingVo {

    /* input */
    private String search;
    private String searchType;

    /* output */
    private String push_col1;
    private String push_col2;
    private String push_col3;
    private String push_col4;
    private String push_col5;
    private String push_col6;
    private String push_col7;
}
