package com.dalbit.content.vo.procedure;

import com.dalbit.common.vo.SearchVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class P_EventMemberListInputVo extends SearchVo {
    private int pageNo;
    private int event_idx;              // 이벤트 번호
    private String mem_no;

}
