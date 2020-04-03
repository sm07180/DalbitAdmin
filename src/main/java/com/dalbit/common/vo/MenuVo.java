package com.dalbit.common.vo;

import lombok.Getter;
import lombok.Setter;

import java.sql.Date;

@Getter
@Setter
public class MenuVo {

    public MenuVo(){}

    public MenuVo(int depth){
        this.depth = depth;
    }

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
    private Date reg_date;
    private Date last_upd_date;
}
