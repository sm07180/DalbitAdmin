package com.dalbit.broadcast.vo.procedure;

import com.dalbit.common.vo.PagingVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class P_BroadcastListInputVo extends PagingVo {

    /*  intput  */
    private int slctType;
    private int dj_slctType;
    private String dj_searchText;
    private int room_slctType;
    private String room_searchText;
    private int sortTitle;
    private int sortStartDate;
    private int sortAirTime;
    private int pageNo;
    private int room_liveType;

}