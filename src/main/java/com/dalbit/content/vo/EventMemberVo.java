package com.dalbit.content.vo;

import com.dalbit.common.vo.PagingVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class EventMemberVo extends PagingVo {

    /* input */
    private String txt_search;
    private String searchType;

    /* output */
    private int idx;
    private int event_idx;
    private String mem_no;
    private int platform;
    private int is_win;
    private int order;
    private String name;
    private String contact_no;
    private String recv_data_1;
    private String recv_data_2;
    private String recv_data_3;
    private String recv_data_4;
    private String recv_data_5;
    private String enter_date;
    private int del_yn;
    private String reg_date;
    private String op_name;
    private String last_upd_date;
    private String last_op_name;
    private String mem_nick;
    private String mem_sex;
    private String mem_birth_year;
    private String mem_state;
}
