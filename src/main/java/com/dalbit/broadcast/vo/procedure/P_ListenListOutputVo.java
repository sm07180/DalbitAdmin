package com.dalbit.broadcast.vo.procedure;

import com.dalbit.common.vo.PagingVo;
import com.dalbit.util.DalbitUtil;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class P_ListenListOutputVo extends PagingVo {

    /* return result */
    private int auth;
    private int state;
    private String mem_no;
    private String userID;
    private String nickName;
    private String level;
    private String grade;
    private Date start_date;
    private String startDateFormat;
    private Date end_date;
    private String endDateFormat;
    private String listenTime;
    private Date auth_start_date;
    private String authStartDateFormat;
    private Date auth_end_date;
    private String authEndDateFormat;
    private int goodCnt;
    private int boosterCnt;
    private int giftCnt;
    private int pageNo;
    private int listenerCnt;
    private int managerCnt;
    private int forcedCnt;
    private int totalGoodCnt;
    private int totalBoosterCnt;
    private int totalGiftCnt;

    public void setStart_date(Date start_date){
        this.start_date = start_date;
        this.startDateFormat = DalbitUtil.convertDateFormat(start_date, "yyyy.MM.dd HH.mm.ss");
    }
    public void setEnd_date(Date start_date){
        this.end_date = start_date;
        this.endDateFormat = DalbitUtil.convertDateFormat(end_date, "yyyy.MM.dd HH.mm.ss");
    }
    public void setAuth_start_date(Date auth_start_date){
        this.auth_start_date = auth_start_date;
        this.authStartDateFormat = DalbitUtil.convertDateFormat(auth_start_date, "yyyy.MM.dd HH.mm.ss");
    }
    public void setAuth_end_date(Date auth_end_date){
        this.auth_end_date = auth_end_date;
        this.authEndDateFormat = DalbitUtil.convertDateFormat(auth_end_date, "yyyy.MM.dd HH.mm.ss");
    }
}


