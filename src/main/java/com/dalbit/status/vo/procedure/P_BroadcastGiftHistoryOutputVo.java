package com.dalbit.status.vo.procedure;

import com.dalbit.common.vo.BaseVo;
import lombok.Getter;
import lombok.Setter;

import java.sql.Date;

@Getter
@Setter
public class P_BroadcastGiftHistoryOutputVo extends BaseVo {

    private Date purchaseDate;
    private String mem_no;
    private String mem_userid;
    private String mem_nick;
    private String item_code;
    private String item_name;
    private String item_thumbnail;
    private int item_type;
    private String room_no;
    private String title;
    private int itemCnt;
    private int itemAmt;
    private String gifted_mem_no;
    private String gifted_mem_userid;
    private String gifted_mem_nick;
}
