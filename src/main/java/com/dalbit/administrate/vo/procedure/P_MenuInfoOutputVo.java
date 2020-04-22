package com.dalbit.administrate.vo.procedure;

import com.dalbit.common.vo.BaseVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter

public class P_MenuInfoOutputVo extends BaseVo {
    private int idx;
    private String menu_name;
    private String menu_url;
    private int depth;
    private int order_no;
    private int parent_idx;
    private String icon;
    private int is_pop;
    private int is_comming_soon;
    private int is_use;
}