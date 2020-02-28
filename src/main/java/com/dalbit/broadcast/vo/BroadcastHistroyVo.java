package com.dalbit.broadcast.vo;

import com.dalbit.common.vo.ImageVo;
import com.dalbit.util.DalbitUtil;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BroadcastHistroyVo {

    /*  intput  */
    private String roomNo;
    private String tmp;

    /* return result */
    private String auth;
    private String memNo;
    private String memNick;
    private String listenStDate;
    private String managerStDate;
    private String managerEdDate;
    private String manager;
    private String writeDate;
    private String contents;

}