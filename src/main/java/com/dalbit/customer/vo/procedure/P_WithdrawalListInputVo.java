package com.dalbit.customer.vo.procedure;

import com.dalbit.common.vo.SearchVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class P_WithdrawalListInputVo extends SearchVo {
    private String startDate;
    private String endDate;

    private String opCode;			// 회원상태	(1:정상,2:경고,3:1일정지,4:3일정지,5:7일정지,6:영구정지,7:강제탈퇴)

}
