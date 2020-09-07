package com.dalbit.money.vo.procedure;

import com.dalbit.common.vo.PagingVo;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class P_ResourceInfoInPutVo extends PagingVo {

    private int slctType;
    private String startDate;
    private String endDate;

    private int type;
    private int orderType;

}
