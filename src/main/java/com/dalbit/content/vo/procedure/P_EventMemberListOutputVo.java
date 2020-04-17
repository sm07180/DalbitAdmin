package com.dalbit.content.vo.procedure;

import com.dalbit.common.vo.BaseVo;
import com.dalbit.util.DalbitUtil;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class P_EventMemberListOutputVo extends BaseVo {

    private int idx;
    private int event_idx;
    private String mem_no;
    private int platform;
    private int is_win;
    private int order;
    private Date enter_date;
    private String enterDateFormat;
    private Date reg_date;
    private String regDateFormat;
    private String op_name;
    private Date last_upd_date;
    private String lastUpdDateFormat;
    private String last_op_name;

    private String mem_userid;
    private String mem_nick;
    private String mem_sex;
    private String mem_phone;
    private int listenCnt;
    private int broadCnt;
    private int giftCnt;
    private int applyCnt;
    private int winCnt;

    public void setEnter_date(Date enter_date){
        this.enter_date = enter_date;
        this.enterDateFormat = DalbitUtil.convertDateFormat(enter_date, "yyyy.MM.dd HH:mm:ss");
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
