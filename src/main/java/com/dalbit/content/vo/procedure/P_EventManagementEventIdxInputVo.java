package com.dalbit.content.vo.procedure;

import com.dalbit.common.vo.PagingVo;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class P_EventManagementEventIdxInputVo extends PagingVo {
    private int pageNo;
    private int eventIdx;
}
