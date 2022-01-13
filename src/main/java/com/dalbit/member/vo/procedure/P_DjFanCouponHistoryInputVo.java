package com.dalbit.member.vo.procedure;

import com.dalbit.common.vo.PagingVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class P_DjFanCouponHistoryInputVo extends PagingVo {
    private String mem_no; // 회원번호
    private String chrgrMemName; // 관리자 이름
    private int pageNo = 1;
    private int pagePerCnt = 10;
}
