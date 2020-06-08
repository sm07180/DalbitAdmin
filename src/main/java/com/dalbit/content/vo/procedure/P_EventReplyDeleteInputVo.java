package com.dalbit.content.vo.procedure;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class P_EventReplyDeleteInputVo {

    /* Input */
    private String mem_no;
    private int event_idx;		//이벤트 번호
    private int reply_idx;         //이벤트 댓글 번호
    private String opName;

}
