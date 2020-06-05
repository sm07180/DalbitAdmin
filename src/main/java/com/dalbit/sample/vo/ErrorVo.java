package com.dalbit.sample.vo;

import com.dalbit.common.vo.PagingVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ErrorVo extends PagingVo {
    /* input */
    private String txt_startSel;
    private String txt_endSel;
    private String searchType;
    private String searchText;

    /* output */
    private int idx;
    private String mem_no;
    private String ostype;
    private String version;
    private String build;
    private String dtype;
    private String ctype;
    private String desc;
    private String upd_date;
}
