package com.dalbit.menu.vo;

import com.dalbit.common.vo.PagingVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SpecialSummaryVo extends PagingVo {

    /* output */
    private int requestDal;
    private int approveDal;

}
