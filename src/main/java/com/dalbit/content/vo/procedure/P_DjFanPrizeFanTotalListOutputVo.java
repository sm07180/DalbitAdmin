package com.dalbit.content.vo.procedure;

import lombok.Data;

@Data
public class P_DjFanPrizeFanTotalListOutputVo {
    private int rank_no;
    private String mem_no;
    private String mem_phone;
    private String mem_nick;
    private int use_coupon_cnt;
    private int tot_use_coupon_cnt;
    private int level;
    private int exp;
}
