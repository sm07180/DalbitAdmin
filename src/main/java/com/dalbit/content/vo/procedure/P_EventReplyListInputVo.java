package com.dalbit.content.vo.procedure;

import com.dalbit.common.vo.SearchVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class P_EventReplyListInputVo extends SearchVo {

    /* Input */
    private Integer event_idx;               //이벤트 번호
    private int pageNo;

}
