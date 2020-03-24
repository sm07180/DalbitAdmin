package com.dalbit.broadcast.vo.procedure;

import com.dalbit.common.vo.PagingVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class P_BroadcastListenListInputVo extends PagingVo {

    /*  intput  */
    private String room_no;
    private int sortAuth;
    private int sortState;
    private int pageNo;
}






