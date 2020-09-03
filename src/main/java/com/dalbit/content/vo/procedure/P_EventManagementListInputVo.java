package com.dalbit.content.vo.procedure;

import com.dalbit.common.vo.PagingVo;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class P_EventManagementListInputVo extends PagingVo {
    private int stateSlct;
    private int announceSlct;
    private String searchText;
}
