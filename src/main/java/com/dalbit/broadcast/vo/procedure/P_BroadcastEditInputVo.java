package com.dalbit.broadcast.vo.procedure;

import com.dalbit.common.vo.ImageVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class P_BroadcastEditInputVo {
    private String room_no;
    private String mem_no;
    private String backgroundImage;
    private ImageVo backgroundImage_reset;
    private String welcomMsg;
    private String title;
    private String entryType;
    private String freezeMsg;
    private String forceExit;
    private String sendNoti;
    private String notiContents;
    private String notiMeno;
    private String opName;
}
