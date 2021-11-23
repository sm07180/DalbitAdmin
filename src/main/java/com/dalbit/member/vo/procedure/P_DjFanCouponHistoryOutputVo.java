package com.dalbit.member.vo.procedure;

import com.dalbit.common.vo.SearchVo;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class P_DjFanCouponHistoryOutputVo extends SearchVo {
    private String auto_no;
    private String mem_no;
    private String coupon_cnt;
    private String coupon_slct;
    private Date ins_date;
}
