package com.dalbit.menu.vo;

import com.dalbit.common.vo.PagingVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SpecialDjOrderVo extends PagingVo {

    private String orderJsonData;
    /* input */
    private String mem_no;
    private int order;

}
