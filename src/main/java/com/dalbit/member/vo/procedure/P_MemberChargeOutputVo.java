package com.dalbit.member.vo.procedure;

import com.dalbit.common.vo.SearchVo;
import com.dalbit.util.DalbitUtil;
import lombok.Getter;
import lombok.Setter;

import java.sql.Date;

@Getter
@Setter
public class P_MemberChargeOutputVo extends SearchVo {

    //output
    private String mem_no;
    private String mem_userid;
    private String mem_nick;
    private String mem_sex;
    private String use_contents;
    private String image;
    private String itemNm;
    private int cnt;
    private Date lastUpdDate;
    private String lastUpdDateFormat;
    private String type;
    private String itemType;

    //summary
    private int allDalGiftCnt;
    private int allDalReceivedCnt;
    private int allByeolReceivedCnt;

    public void setLastUpdDate(Date lastUpdDate){
        this.lastUpdDate = lastUpdDate;
        this.lastUpdDateFormat = DalbitUtil.convertDateFormat(lastUpdDate, "yyyy.MM.dd HH:mm:ss");
    }
}
