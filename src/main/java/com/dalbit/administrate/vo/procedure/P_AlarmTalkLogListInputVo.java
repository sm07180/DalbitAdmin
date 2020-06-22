package com.dalbit.administrate.vo.procedure;

import com.dalbit.common.vo.PagingVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class P_AlarmTalkLogListInputVo extends PagingVo {
    private String txt_startSel;
    private String txt_endSel;
    private String searchType;
    private String searchText;
    private String result_code;
}

