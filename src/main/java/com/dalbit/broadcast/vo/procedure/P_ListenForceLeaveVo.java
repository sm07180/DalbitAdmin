package com.dalbit.broadcast.vo.procedure;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class P_ListenForceLeaveVo {
    private String room_no;
    private String mem_no;
    private String sendNoti;
    private String notiContents;
    private String notiMeno;
}
