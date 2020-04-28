package com.dalbit.administrate.vo.procedure;

import com.dalbit.common.vo.BaseVo;
import com.dalbit.util.DalbitUtil;
import lombok.Getter;
import lombok.Setter;

import java.sql.Date;

@Getter
@Setter
public class P_TermsListOutputVo extends BaseVo {

    private int idx;
    private int view_on;
    private int platform;
    private int terms_type;
    private String terms_title;
    private String terms_content;
    private String version;
    private Date reg_date;
    private String regDateFormat;
    private String op_name;
    private Date last_upd_date;
    private String lastUpdDateFormat;
    private String last_op_name;
    private String meno;

    public void setReg_date(Date reg_date){
        this.reg_date = reg_date;
        this.regDateFormat = DalbitUtil.convertDateFormat(reg_date, "yyyy-MM-dd HH:mm:ss");
    }

    public void setLast_upd_date(Date last_upd_date) {
        this.last_upd_date = last_upd_date;
        this.lastUpdDateFormat = DalbitUtil.convertDateFormat(last_upd_date, "yyyy-MM-dd HH:mm:ss");
    }
}
