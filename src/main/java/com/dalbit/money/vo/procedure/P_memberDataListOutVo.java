package com.dalbit.money.vo.procedure;

import com.dalbit.util.DalbitUtil;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.sql.Date;

@Getter
@Setter
@ToString
public class P_memberDataListOutVo {

    private int rowNum;
    private String mem_no;
    private String memNick;
    private String memSex;
    private int memAge;
    private int memState;
    private String airtime;
    private String listentime;
    private int castcount;
    private int castDelcount;
    private int payAmt;
    private int cancelAmt;
    private int totalDal;
    private int freeDal;
    private int useDal;
    private int nowDal;
    private int totalByeol;
    private int freeByeol;
    private int changeByeol;
    private int exchangeByeol;
    private int exchangeAmt;
    private int nowByeol;
    private Date memJoinDate;
    private String memJoinDateFormat;
    private int inner;
    private String memLoginDate;

    private int totalCnt;

    public void setMemJoinDate(Date memJoinDate){
        this.memJoinDate = memJoinDate;
        this.memJoinDateFormat = DalbitUtil.convertDateFormat(memJoinDate, "yyyy.MM.dd HH:mm:ss");
    }

}
