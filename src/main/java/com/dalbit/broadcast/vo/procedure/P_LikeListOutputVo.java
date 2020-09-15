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
    private String mem_sex;
    private String mem_birth_year;
    private String mem_birth_month;
    private String mem_birth_day;
    private int level;
    private String grade;
    private String goodDate;
    private int accumCnt;
    private Date boosterDate;
    private String boosterDateFormat;
    private int rank;
    private int goodCnt;
    private int boosterCnt;
    private int inner;

//    public void setGoodDate(Date goodDate){
//        this.goodDate = goodDate;
//        this.goodDateFormat = DalbitUtil.convertDateFormat(goodDate, "yyyy.MM.dd HH:mm:ss");
//    }
    public void setBoosterDate(Date boosterDate){
        this.boosterDate = boosterDate;
        this.boosterDateFormat = DalbitUtil.convertDateFormat(boosterDate, "yyyy.MM.dd HH:mm:ss");
    }
}


