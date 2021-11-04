package com.dalbit.content.vo.procedure;

import lombok.Data;

import java.util.Date;

@Data
public class P_DjFanPrizeFanListOutputVo {
    private int rank_no;
    private int evt_no;
    private String mem_no;
    private String mem_phone;
    private String mem_nick;
    private int use_coupon_cnt;
    private int view_time;
    private Date ins_date;
}
