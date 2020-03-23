package com.dalbit.broadcast.vo.procedure;

import com.dalbit.common.vo.SearchVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class P_BroadcastEditHistInputVo extends SearchVo {
    private String room_no;
    private int pageNo;
}
