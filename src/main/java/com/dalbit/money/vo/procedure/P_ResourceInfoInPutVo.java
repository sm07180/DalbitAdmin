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
    private int slctResource;
    private String startDate;
    private String endDate;
    private String searchText;

    private int type;
    private int orderType;

}