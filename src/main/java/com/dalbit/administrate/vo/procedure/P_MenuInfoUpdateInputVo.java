package com.dalbit.administrate.vo.procedure;

import com.dalbit.common.vo.BaseVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class P_MenuInfoUpdateInputVo extends BaseVo {
    private int idx;
    private String menu_url;
    private String icon;
    private int is_pop;
    private int is_comming_soon;
    private int is_use;
}
