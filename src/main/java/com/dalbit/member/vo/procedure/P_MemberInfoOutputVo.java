package com.dalbit.member.vo.procedure;

import com.dalbit.common.vo.ImageVo;
import com.dalbit.common.vo.SearchVo;
import com.dalbit.util.DalbitUtil;
import lombok.Getter;
import lombok.Setter;

import java.sql.Date;

@Getter
@Setter
public class P_MemberInfoOutputVo extends SearchVo {

    private String profileImage;
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
    private String memState;
    private String connectState;
    private String broadcastState;
    private String listeningState;
    private int dal;
    private int byeol;
    private int managerICnt;
    private int managerMeCnt;
    private int blackICnt;
    private int blackMeCnt;
    private String memSlct;
    private String joinDate;
    private String withdrawalDate;
    private String firstBroadcastDate;
    private String lastOpDate;
    private String lastOpName;
    private String memWithdrawal;
    private String last_upd_date;       // 탈퇴일시

    private String certification;
    private String comm_company;
    private String block_day;
    private Date block_end_date;
    private String blockEndDateFormat;
    private int inner;

    // 방송중인 방
    private String room_no;
    private String title;
    private String hide;

    // 청취중인 방
    private String listen_room_no;
    private String listen_title;

    // 회원 배찌
    private String recomm_badge;
    private String newdj_badge;
    private String specialdj_badge;

    public void setBlock_end_date(Date block_end_date){
        this.block_end_date = block_end_date;
        this.blockEndDateFormat = DalbitUtil.convertDateFormat(block_end_date, "yyyy.MM.dd HH:mm:ss");
    }
}
