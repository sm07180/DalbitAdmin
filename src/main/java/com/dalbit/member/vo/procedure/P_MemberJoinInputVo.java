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

    // order by ------------------------
    private int memJoinDateSort;
    private int memNickSort;
    private int memLoginIdSort;
    private int memIpSort;
    private int memJoinPath;
    private int withdrawalDateSort;
    private int serviceDateSort;

    private int memJoinDateSort_withdrawal;
    private int memNickSort_withdrawal;
    private int memLoginIdSort_withdrawal;
    private int memIpSort_withdrawal;
}
