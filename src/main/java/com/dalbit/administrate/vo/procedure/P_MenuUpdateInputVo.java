package com.dalbit.administrate.vo.procedure;

import com.dalbit.common.vo.BaseVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class P_MenuUpdateInputVo extends BaseVo {
    private String idx;
    private int orderNo;
    private String menu_name;
    private int depth;
    private int parent_idx;
}
