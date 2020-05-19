package com.dalbit.menu.vo;

import com.dalbit.common.vo.PagingVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SpecialVo extends PagingVo {

    /* input */
    private String txt_search;
    private String searchType;

    /* output */
    private int req_idx;
    private String mem_no;
    private String reg_date;
    private String is_force;
    private int order;
    private String op_name;
    private String title;
    private String contents;

}
