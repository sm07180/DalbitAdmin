package com.dalbit.broadcast.vo.procedure;

import com.dalbit.common.vo.PagingVo;
import com.dalbit.util.DalbitUtil;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class P_LikeListOutputVo extends PagingVo {

    /* return result */
    private String mem_no;
    private String mem_userid;
    private String mem_nick;
    private int level;
    private String grade;
    private String goodDate;
//    private Date goodDate;
//    private String goodDateFormat;
    private int accumCnt;
    private Date boosterDate;
    private String boosterDateFormat;
    private int rank;
    private int goodCnt;
    private int boosterCnt;

//    public void setGoodDate(Date start_date){
//        this.goodDate = goodDate;
//        this.goodDateFormat = DalbitUtil.convertDateFormat(goodDate, "yyyy.MM.dd HH.mm.ss");
//    }
    public void setBoosterDate(Date start_date){
        this.boosterDate = start_date;
        this.boosterDateFormat = DalbitUtil.convertDateFormat(boosterDate, "yyyy.MM.dd HH.mm.ss");
    }
}


