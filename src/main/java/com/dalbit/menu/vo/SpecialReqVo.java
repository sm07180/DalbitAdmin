package com.dalbit.menu.vo;

import com.dalbit.common.vo.PagingVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SpecialReqVo extends PagingVo {

    /* input */
    private String txt_search;
    private String searchType;
    private int is_force;
    private String select_year;
    private String select_month;

    /* output */
    private int idx;
    private String mem_no;
    private String mem_name;
    private String mem_phone;
    private String title;
    private String reg_date;
    private String contents;
    private int state;
    private String op_name;
    private String last_upd_date;
    private int specialdj_badge;

}
