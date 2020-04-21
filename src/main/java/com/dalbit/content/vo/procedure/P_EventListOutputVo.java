package com.dalbit.content.vo.procedure;

import com.dalbit.common.vo.BaseVo;
import com.dalbit.util.DalbitUtil;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class P_EventListOutputVo extends BaseVo {

    private int idx;
    private String event_title;
    private int event_slct;
    private int is_pop;
    private int is_view;
    private String state;
    private String pc_img_url;
    private String pc_link_url;
    private String mobile_img_url;
    private String mobile_link_url;
    private String thumb_img_url;
    private String desc;
    private String op_name;
    private String last_op_name;
    private String platform;

    private Date start_datetime;
    private Date end_datetime;
    private Date view_start_datetime;
    private Date view_end_datetime;
    private Date reg_date;
    private Date last_upd_date;

    private String startDatetimeFormat;
    private String endDatetimeFormat;
    private String viewStartDatetimeFormat;
    private String viewEndDatetimeFormat;
    private String regDateFormat;
    private String lastUpdDateFormat;

    private int mem_cnt;
    private int male_cnt;
    private int female_cnt;
    private int win_cnt;

    public void setStart_datetime(Date start_datetime){
        this.start_datetime = start_datetime;
        this.startDatetimeFormat = DalbitUtil.convertDateFormat(start_datetime, "yyyy.MM.dd HH:mm:ss");
    }
    public void setEnd_datetime(Date end_datetime){
        this.end_datetime = end_datetime;
        this.endDatetimeFormat = DalbitUtil.convertDateFormat(end_datetime, "yyyy.MM.dd HH:mm:ss");
    }
    public void setView_start_datetime(Date view_start_datetime){
        this.view_start_datetime = view_start_datetime;
        this.viewStartDatetimeFormat = DalbitUtil.convertDateFormat(view_start_datetime, "yyyy.MM.dd HH:mm:ss");
    }
    public void setView_end_datetime(Date view_end_datetime){
        this.view_end_datetime = view_end_datetime;
        this.viewEndDatetimeFormat = DalbitUtil.convertDateFormat(view_end_datetime, "yyyy.MM.dd HH:mm:ss");
    }
    public void setReg_date(Date reg_date){
        this.reg_date = reg_date;
        this.regDateFormat = DalbitUtil.convertDateFormat(reg_date, "yyyy.MM.dd HH:mm:ss");
    }
    public void setLast_upd_date(Date last_upd_date){
        this.last_upd_date = last_upd_date;
        this.lastUpdDateFormat = DalbitUtil.convertDateFormat(last_upd_date, "yyyy.MM.dd HH:mm:ss");
    }
}
