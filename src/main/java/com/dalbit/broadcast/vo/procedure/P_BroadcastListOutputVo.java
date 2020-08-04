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
    private String subject_name;
    private String title;
    private String dj_profileImage;
    private String dj_mem_no;
    private String dj_userid;
    private String dj_nickname;
    private String dj_memSex;
    private String dj_level;
    private String dj_grade;
    private int recommBadge;
    private int popularBadge;
    private int newjdBadge;
    private int specialdj_badge;
    private int state;
    private Date start_date;
    private String startDateFormat;
    private Date end_date;
    private String endDateFormat;
    private int airTime;
    private int liveListener;
    private int totalListener;
    private int giftCnt;
    private int byeolCnt;
    private int goodCnt;
    private int boosterCnt;
    private int fanCnt;
    private int forcedCnt;
    private int storyCnt;
    private int osType;
    private int exit_try_count;
    private String backgroundImage;
    private int hide;
    private String dj_birth_year;
    private String dj_birth_month;
    private String dj_birth_day;
    private String dj_korean_age;
    private int broadCastCnt;
    private int extend_time_count;

    /* summary */
    private int totalBroadCastCnt;
    private int totalIosCnt;
    private int totalAosCnt;
    private int totalPcCnt;

    private int totalListenerCnt;
    private int liveListenerCnt;
    private int totalGoodCnt;
    private int totalGiftCnt;
    private int totalBoosterCnt;
    private int totalForcedCnt;

    //DJ 구분 수
    private int recommDjCnt;
    private int normalDjCnt;
    private int newDjCnt;
    private int specialDjCnt;

    private int totalListenMaleCnt;
    private int totalListenFemaleCnt;
    private int totalListenNoneCnt;
    private int liveListenMaleCnt;
    private int liveListenFemaleCnt;
    private int liveListenNoneCnt;
    private int broadMaleCnt;
    private int broadFemaleCnt;
    private int broadNoneCnt;
    private int broadStateNomal;
    private int broadBreak;

    public void setStart_date(Date start_date){
        this.start_date = start_date;
        this.startDateFormat = DalbitUtil.convertDateFormat(start_date, "yyyy.MM.dd HH:mm:ss");
    }
    public void setEnd_date(Date end_date){
        this.end_date = end_date;
        this.endDateFormat = DalbitUtil.convertDateFormat(end_date, "yyyy.MM.dd HH:mm:ss");
    }
}


