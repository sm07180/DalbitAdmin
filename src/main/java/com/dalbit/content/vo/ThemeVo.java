package com.dalbit.content.vo;

import com.dalbit.common.vo.PagingVo;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class ThemeVo extends PagingVo {

    /* input */
    private String search;
    private String searchType;

    /* output */
    private String theme_col1;
    private String theme_col2;
    private String theme_col3;
    private Date theme_col4;
    private String theme_col5;
    private Date theme_col6;
    private String theme_col7;

}
