package com.dalbit.member.vo.procedure;

import com.dalbit.common.vo.SearchVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class P_MemberDjFanCouponVo extends SearchVo {

    private String mem_no;
    private int pageNo;
    private String couponCnt;

    private String issue_date;
    private String last_upd_date;
}
