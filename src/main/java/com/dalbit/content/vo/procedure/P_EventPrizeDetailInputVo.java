package com.dalbit.content.vo.procedure;

import com.dalbit.common.vo.PagingVo;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class P_EventPrizeDetailInputVo extends PagingVo {
    private int eventIdx;
    private int prizeIdx;
}
