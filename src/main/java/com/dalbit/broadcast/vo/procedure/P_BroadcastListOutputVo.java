package com.dalbit.broadcast.vo.procedure;

import com.dalbit.common.vo.PagingVo;
import com.dalbit.util.DalbitUtil;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class P_BroadcastListOutputVo extends PagingVo {

    /* return result */
    private String room_no;
    private String subjectType;
    private String title;
    private String dj_profileImage;
    private String dj_mem_no;
    private String dj_userid;
    private String dj_nickname;
    private String dj_sex;
    private String dj_level;
    private String dj_grade;
    private int recommBadge;
    private int popularBadge;
    private int newjdBadge;
    private int state;
    private Date start_date;
    private String startDateFormat;
    private int airTime;
    private int liveListener;
    private int totalListener;
    private int giftCnt;
    private int goodCnt;
    private int boosterCnt;
    private int fanCnt;
    private int forcedCnt;
    private int storyCnt;

    /* total */
    private int totalListenerCnt;
    private int totalGoodCnt;
    private int totalGiftCnt;
    private int totalBoosterCnt;
    private int totalForcedCnt;


    public void setStart_date(Date start_date){
        this.start_date = start_date;
        this.startDateFormat = DalbitUtil.convertDateFormat(start_date, "yyyy.MM.dd HH.mm.ss");
    }
}


