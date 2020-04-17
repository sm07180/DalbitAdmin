package com.dalbit.content.vo.procedure;

import com.dalbit.common.vo.SearchVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class P_EventListInputVo extends SearchVo {
    private int pageNo;
    private int state;              // 이벤트 상태

}
