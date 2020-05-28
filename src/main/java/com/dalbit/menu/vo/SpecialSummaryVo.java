package com.dalbit.menu.vo;

import com.dalbit.common.vo.PagingVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SpecialSummaryVo extends PagingVo {

    /* input */
    private String select_year;
    private String select_month;

    /* output */
    private int requestDal;
    private int approveDal;

}
