package com.dalbit.content.vo.procedure;

import com.dalbit.common.vo.PagingVo;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class P_EventWinnerApplicantInputVo extends PagingVo {
    private int pageNo;
    private int eventIdx;
    private int sortSlct;
    private int winSlct;
    private int duplicateHide;
}
