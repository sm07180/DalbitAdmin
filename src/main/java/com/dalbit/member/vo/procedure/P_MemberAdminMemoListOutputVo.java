package com.dalbit.member.vo.procedure;

import com.dalbit.common.vo.SearchVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class P_MemberAdminMemoListOutputVo extends SearchVo {

    private String memoSlct;
    private String memNo;
    private String regDate;
    private String memo;
    private int idx;

}
