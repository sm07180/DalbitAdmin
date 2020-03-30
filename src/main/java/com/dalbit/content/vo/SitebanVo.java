package com.dalbit.content.vo;

import com.dalbit.common.vo.PagingVo;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class SitebanVo extends PagingVo {

    /* input */
    private String search;
    private String searchType;

    /* output */
    private String siteban_col1;
    private String siteban_col2;
    private String siteban_col3;
    private Date siteban_col4;
    private String siteban_col5;
    private Date siteban_col6;
    private String siteban_col7;

}
