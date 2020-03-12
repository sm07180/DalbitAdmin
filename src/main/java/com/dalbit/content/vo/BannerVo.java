package com.dalbit.content.vo;

import com.dalbit.common.vo.PagingVo;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class BannerVo extends PagingVo {

    /* input */
    private String search;
    private String searchType;

    /* output */
    private String banner_col1;
    private String banner_col2;
    private String banner_col3;
    private Date banner_col4;
    private String banner_col5;
    private Date banner_col6;
    private String banner_col7;

}
