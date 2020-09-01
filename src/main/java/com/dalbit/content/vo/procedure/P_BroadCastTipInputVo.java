package com.dalbit.content.vo.procedure;

import com.dalbit.common.vo.SearchVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class P_BroadCastTipInputVo extends SearchVo {
    private int pageNo;
    private int idx;
    private int viewTarget;
    private String tipDesc;
    private String delete_idx_list;
}
