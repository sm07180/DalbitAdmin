package com.dalbit.enter.vo.procedure;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class P_RevenueProcessVo {

    // input ------------------------
    private int slctType;
    private String startDate;
    private String endDate;
    private int pageNo;
    private int pageCnt;


    //output --------------------------

    private String the_date;
    private long totalDal;
    private long payAmt;
    private long payDal;
    private long freeAmt;
    private long freeDal;
    private long totalAmt;
    private long totalByeol;
    private long unpaidAmt;
    private long salesAmt;
    private long byeol;
    private long dalAmt;
    private long byeolAmt;

    private String mem_no;
    private String nickName;
    private String memSex;
    private String memAge;
    private String memType;
    private long totalCnt;

    private long oldPayDal;
    private long oldFreeDal;
    private long addTotalDal;
    private long addPayTotal;
    private long addPayPg;
    private long addPayChange;
    private long addPayGift;
    private long addPayOp;
    private long addFreeTotal;
    private long addFreeEvent;
    private long addFreeGift;
    private long addFreeOp;
    private long subTotalDal;
    private long subPayTotal;
    private long subPayBroad;
    private long subPayBroadV;
    private long subPayClip;
    private long subPayMailbox;
    private long subPayGift;
    private long subPayCancel;
    private long subPayWithdrawal;
    private long subPayWithdrawalSleep;
    private long subPayOp;
    private long subFreeTotal;
    private long subFreeBroad;
    private long subFreeBroadV;
    private long subFreeClip;
    private long subFreeMailbox;
    private long subFreeGift;
    private long subFreeCancel;
    private long subFreeWithdrawal;
    private long subFreeWithdrawlSleep;
    private long subFreeOp;
    private long newPayDal;
    private long newFreeDal;
    private long errorPayDal;
    private long errorFreeDal;

    private long oldByeol;
    private long addTotal;
    private long addEvent;
    private long addBroad;
    private long addBroadV;
    private long addClip;
    private long addMailbox;
    private long addChangeCancel;
    private long addOp;
    private long subTotal;
    private long subExchange;
    private long subChange;
    private long subWithdrawal;
    private long subWithdrawalSleep;
    private long subOp;
    private long newByeol;
    private long errorByeol;

    private long firstAmt;
    private long withdrawalPayDal;
    private long withdrawalFreeDal;
    private long withdrawalByeol;

    private long freeSalesAmt;
    private long subPayBooster;         // 유료 부스터-음성
    private long subPayBoosterV;        // 유료 부스터-영상
    private long subFreeBooster;        // 무료 부스터-음성
    private long subFreeBoosterV;       // 무료 부스터-영상



}
