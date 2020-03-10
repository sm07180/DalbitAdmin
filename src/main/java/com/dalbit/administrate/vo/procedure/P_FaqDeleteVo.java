package com.dalbit.administrate.vo.procedure;

import com.dalbit.common.vo.BaseVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class P_FaqDeleteVo extends BaseVo {
    public P_FaqDeleteVo(){}

    public P_FaqDeleteVo(String faqIdx){
        this.faqIdx = Integer.valueOf(faqIdx);
    }

    private int faqIdx;
    private String faqIdxs;
}
