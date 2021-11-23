package com.dalbit.member.vo.procedure;

import com.dalbit.common.vo.ImageVo;
import com.dalbit.common.vo.SearchVo;
import com.dalbit.util.DalbitUtil;
import lombok.Getter;
import lombok.Setter;

import java.sql.Date;
import java.util.List;

@Getter
@Setter
public class P_MemberInfoOutputVo extends SearchVo {

    private String profileImage;
    private String profileMsg;
    private String roomBgImage;
    private ImageVo profileImage_reset;
    private String mem_no;
    private String userId;
    private String userName;
    private String socialId;
    private String phoneNum;
    private String nickName;
    private String mem_sex;
    private String birthDate;
    private int age;
    private String memSex;
    private int opMemoCnt;
    private int level;
    private String grade;
    private int exp;
    private String expPer;
    private String memState;
    private String connectState;
    private String broadcastState;
    private String micState;
    private String listeningState;
    private int dal;
    private int money;
    private int totalDal;
    private int byeol;
    private int silver;
    private int totalByeol;
    private int managerICnt;
    private int managerMeCnt;
    private int blackICnt;
    private int blackMeCnt;
    private String memSlct;
    private String joinDate;
    private String withdrawalDate;
    private String firstBroadcastDate;
    private String lastBroadcastDate;
    private String lastOpDate;
    private String lastOpName;
    private String memWithdrawal;
    private String last_upd_date;       // 탈퇴일시

    List fanBadgeList;
    List liveBadgeList;


    private int op_code_2_cnt;   // 경고
    private int op_code_3_cnt;   // 1일 정지
    private int op_code_4_cnt;   // 3일 정지
    private int op_code_5_cnt;   // 7일 정지
    private int op_code_6_cnt;   // 영구 정지

    private int clipListenCnt;      //청취 클립 건수 (비중복)
    private int clipPlayCnt;         // 클립 재생 횟수
    private int couponCnt;         // 응모권 갯수
    private int novemberCouponCnt;    // 11월 경품 응모권 갯수
    private int fanrankOnOffCnt;   // 팬랭킹 미반영 횟수
    private int boostItemCnt;       //부스터 아이템 갯수

    private int payCnt;
    private int payAmt;
    private int payCanCnt;
    private int payCanAmt;

    private int brodCnt;
    private int broadTime;
    private int byeolCnt;
    private int listenerCnt;
    private int goodCnt;
    private int boostCnt;

    private int listenCnt;
    private int listenTime;
    private int dalCnt;

    private int sendDal;

    private int exchangeCnt;
    private int exchangeAmt;

    private int exchangeCancelCnt;
    private int exchangeCancelAmt;

    private int changeCnt;
    private int changeByeol;

    private int clipCnt;
    private int clipByeol;
    private int clipPlay;
    private int clipGood;

    private String certification;
    private String comm_company;
    private String auth_yn;
    private String parents_agree_yn;
    private String recant_yn;
    private int block_type;
    private String block_day;
    private String block_end_date;
    private String blockEndDateFormat;
    private int inner;

    //본인인증 철회 데이터 존재여부
    private String certificationBakYn;

    // 방송중인 방
    private String room_no;
    private String title;
    private String hide;
    private String type_media;

    // 청취중인 방
    private String listen_room_no;
    private String listen_title;

    // 회원 배찌
    private String recomm_badge;
    private String newdj_badge;
    private String specialdj_badge;
    private String new_badge;

    //마지막 로그인 정보
    private String ip;
    private String deviceUuid;
    private String deviceModel;

    private int idx;
    private int leader_yn;


    /*public void setBlock_end_date(Date block_end_date){
        this.block_end_date = block_end_date;
        this.blockEndDateFormat = DalbitUtil.convertDateFormat(block_end_date, "yyyy.MM.dd HH:mm:ss");
    }*/
}
