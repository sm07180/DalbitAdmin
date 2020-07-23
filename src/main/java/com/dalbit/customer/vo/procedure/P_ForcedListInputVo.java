package com.dalbit.customer.vo.procedure;

import com.dalbit.common.vo.SearchVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class P_ForcedListInputVo extends SearchVo {
    private String startDate;
    private String endDate;

    String searchTarget;        // 검색 대상 (-1: 전체, 1: 회원, 2: DJ)

}
