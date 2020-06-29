package com.dalbit.customer.vo;

import com.dalbit.common.vo.PagingVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BlockAdmVo extends PagingVo {

    /* input */
    private String searchType;
    private String searchText;
    private String blockType;
    private String report_idx;

    /* output */
    private int block_type;
    private String block_text;
    private int block_day;
    private String block_end_date;
    private String last_upd_date;
    private String op_name;
    private String op_msg;
}
