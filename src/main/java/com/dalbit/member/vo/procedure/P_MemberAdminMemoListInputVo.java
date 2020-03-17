package com.dalbit.member.vo.procedure;

import com.dalbit.common.vo.SearchVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class P_MemberAdminMemoListInputVo extends SearchVo {
    private String mem_no;
    private int pageNo;
}
