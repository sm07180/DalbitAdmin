package com.dalbit.money.vo.procedure;

import com.dalbit.common.vo.PagingVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class P_memberBoostHistListInputVo extends PagingVo {
    private String startDate;
    private int pageNo = 0;
    private int searchType;
    private String searchText;
}
