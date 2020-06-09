package com.dalbit.money.vo;

import com.dalbit.common.vo.PagingVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Mon_ItemInputVo extends PagingVo {

    private Integer idx;
    private String search_year;
    private String search_month;
    private String search_type;
    private String search_value;
    private String search_state;
    private int search_testId;
    private String limitDay;
    private String excelYn;

    private String idxs;
    private String[] idxArr;
    private int state;

}
