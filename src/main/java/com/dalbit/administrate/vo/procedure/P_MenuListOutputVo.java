package com.dalbit.administrate.vo.procedure;

import com.dalbit.common.vo.BaseVo;
import com.dalbit.util.DalbitUtil;
import lombok.Getter;
import lombok.Setter;

import java.sql.Date;

@Getter
@Setter
public class P_MenuListOutputVo extends BaseVo {

    private String id;
    private String parent;
    private String text;
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
    private String regDateFormat;
    private Date last_upd_date;
    private String lastUpdDateFormat;

    public void setreg_date(Date reg_date){
        this.reg_date = reg_date;
        this.regDateFormat = DalbitUtil.convertDateFormat(reg_date, "yyyy-MM-dd HH.mm.ss");
    }
    public void setlast_upd_date(Date last_upd_date){
        this.last_upd_date = last_upd_date;
        this.lastUpdDateFormat = DalbitUtil.convertDateFormat(last_upd_date, "yyyy-MM-dd HH.mm.ss");
    }
}
