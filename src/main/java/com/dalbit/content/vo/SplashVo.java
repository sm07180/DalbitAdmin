package com.dalbit.content.vo;

import com.dalbit.common.vo.PagingVo;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class SplashVo extends PagingVo {

    /* input */
    private String search;
    private String searchType;

    /* output */
    private String splash_col1;
    private String splash_col2;
    private String splash_col3;
    private Date splash_col4;
    private String splash_col5;
    private Date splash_col6;
    private String splash_col7;

}
