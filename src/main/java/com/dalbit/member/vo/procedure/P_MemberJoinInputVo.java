package com.dalbit.member.vo.procedure;

import com.dalbit.common.vo.SearchVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class P_MemberJoinInputVo extends SearchVo {
    private int pageNo;
    private int period;
    private String sDate;
    private String eDate;
    private String memWithdrawal;
    private int testid;
}
