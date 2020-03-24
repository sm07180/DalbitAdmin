package com.dalbit.content.vo;

import com.dalbit.common.vo.PagingVo;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class ItemVo extends PagingVo {

    /* input */
    private String search;
    private String searchType;

    /* output */
    private String item_col1;
    private String item_col2;
    private String item_col3;
    private Date item_col4;
    private String item_col5;
    private Date item_col6;
    private String item_col7;

}
