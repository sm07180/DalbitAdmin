package com.dalbit.content.vo;

import com.dalbit.common.vo.PagingVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ChuseokEventVo extends PagingVo {

    /* input */
    private String txt_startSel;
    private String txt_endSel;
    private String txt_search;
    private String searchType;

    /* output */
    private int idx;
    private String mem_no;
    private String mem_nick;
    private String mem_sex;
    private String mem_birth_year;
    private int level;
    private int dal;
    private String upd_date;
    private String last_upd_date;
    private int ruby;

}
