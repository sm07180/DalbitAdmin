package com.dalbit.member.vo.procedure;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class P_MemberItemVo {
    private String mem_no;
    private int itemType;
    private int slctType;
    private int itemCnt;
    private String opName;
}
