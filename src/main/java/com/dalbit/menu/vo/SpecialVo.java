package com.dalbit.menu.vo;

import com.dalbit.common.vo.PagingVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SpecialVo extends PagingVo {

    /* output */
    private String mem_no;
    private String reg_date;
    private String is_force;
    private int order;
    private String op_name;

}
