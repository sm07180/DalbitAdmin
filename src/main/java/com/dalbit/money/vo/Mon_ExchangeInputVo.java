package com.dalbit.money.vo;

import com.dalbit.common.vo.BaseVo;
import com.dalbit.common.vo.PagingVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Mon_ExchangeInputVo extends PagingVo {

    private int isSpecial;
    private String search_year;
    private String search_month;
    private String search_type;
    private String search_value;
    private String search_state;

}
