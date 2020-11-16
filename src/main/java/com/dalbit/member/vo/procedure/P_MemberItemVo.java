package com.dalbit.member.vo.procedure;

import com.dalbit.common.vo.PagingVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class P_MemberItemVo extends PagingVo {
    private int idx;
    private String mem_no;
    private int itemType;
    private int slctType;
    private int itemCnt;
    private int useCnt;
    private int state;
    private String lastUpdDate;
}
