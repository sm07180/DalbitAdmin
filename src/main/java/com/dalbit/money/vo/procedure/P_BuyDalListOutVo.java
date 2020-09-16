package com.dalbit.money.vo.procedure;

import com.dalbit.util.DalbitUtil;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.sql.Date;

@Getter
@Setter
@ToString
public class P_BuyDalListOutVo {

    private int rowNum;
    private String mem_no;
    private String memNick;
    private String memSex;
    private String memAge;
    private String memSlct;
    private String osType;
    private int dalCnt;
    private int payAmt;
    private Date payDate;
    private String payDateFormat;
    private int total_payCnt;
    private int total_payAmt;
    private Date prev_payDate;
    private String prev_payDateFormat;
    private String re_payDate;
    private int inner;
    private String mem_id;
    private String mem_phone;

    private int totalCnt;

    public void setPayDate(Date payDate){
        this.payDate = payDate;
        this.payDateFormat = DalbitUtil.convertDateFormat(payDate, "yyyy.MM.dd HH:mm:ss");
    }
    public void setPrev_payDate(Date prev_payDate){
        this.prev_payDate = prev_payDate;
        this.prev_payDateFormat = DalbitUtil.convertDateFormat(prev_payDate, "yyyy.MM.dd HH:mm:ss");
    }

}
