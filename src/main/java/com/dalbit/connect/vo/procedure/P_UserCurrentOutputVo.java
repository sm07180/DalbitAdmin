package com.dalbit.connect.vo.procedure;

import com.dalbit.common.vo.SearchVo;
import com.dalbit.util.DalbitUtil;
import lombok.Getter;
import lombok.Setter;

import java.sql.Date;
import java.util.List;

@Getter
@Setter
public class P_UserCurrentOutputVo extends SearchVo {

    //output
    private Date connectDate;
    private String connectDateFormat;
    private String mem_no;
    private String mem_userid;
    private String mem_nick;
    private String mem_name;
    private String mem_sex;
    private String mem_age;
    private String mem_birth_year;
    private String mem_birth_month;
    private String mem_birth_day;
    private String broadcastingCnt;
    private String broadcastingTime;
    private String giftCnt;
    private String giftAmount;
    private String payCnt;
    private String payAmount;
    private String dal;
    private String byeol;
    private Date mem_join_date;
    private String memJoinDateFormat;
    private int inner;

    private String ip;
    private String os_type;
    private String profile;
    private int listenCnt;
    private int listenTime;

    private int day_badge;
    private int week_badge;
    private int month_badge;
    private int recomm_badge;
    private int newdj_badge;
    private int new_badge;
    private int specialdj_badge;
    private int admin_badge;
    List fanBadgeList;
    List liveBadgeList;


    public void setConnectDate(Date connectDate){
        this.connectDate = connectDate;
        this.connectDateFormat = DalbitUtil.convertDateFormat(connectDate, "yyyy.MM.dd HH:mm:ss");
    }
    public void setMem_join_date(Date mem_join_date){
        this.mem_join_date = mem_join_date;
        this.memJoinDateFormat = DalbitUtil.convertDateFormat(mem_join_date, "yyyy.MM.dd HH:mm:ss");
    }
}
