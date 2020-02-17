package com.dalbit.member.vo;

import com.dalbit.common.vo.ImageVo;
import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.util.DalbitUtil;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter
@ToString
public class MemberInfoOutVo {
    String memNo;
    String memId;
    String memPhone;
    String memPasswd;
    String memNick;
    String memSex;
    String birthYear;
    String birthMonth;
    String birthDay;
    String memSlct;
    String memAdid;
    String state;
    String memJoinDate;
    String lastUpdDate;
    String memName;
    String memEmail;
    ImageVo profileImage;
    int age;
    int level;
    String grade;
    int exp;
    int broadcastingCnt;
    int listeningCnt;
    int starCnt;
    int fanCnt;
    int noticeCnt;
    int reportCnt;
    int reportMemCnt;

    public MemberInfoOutVo(MemberInfoVo target) {

        this.memNo=target.getMemNo();
        this.memId=target.getMemId();
        this.memPhone=target.getMemPhone();
        this.memPasswd=target.getMemPasswd();
        this.memNick=target.getMemNick();
        this.memSex=target.getMemSex();
        this.birthYear=target.getBirthYear();
        this.birthMonth=target.getBirthMonth();
        this.birthDay=target.getBirthDay();
        this.memSlct=target.getMemSlct();
        this.memAdid=target.getMemAdid();
        this.state=target.getState();
        this.memJoinDate=target.getMemJoinDate();
        this.lastUpdDate=target.getLastUpdDate();
        this.memName=target.getMemName();
        this.memEmail=target.getMemEmail();
        this.profileImage=new ImageVo(target.getProfileImage(), DalbitUtil.getProperty("server.photo.url"));
        this.age=DalbitUtil.ageCalculation(Integer.parseInt(target.getBirthYear()));
        this.level=target.getLevel();
        this.grade=target.getGrade();
        this.exp=target.getExp();
        this.broadcastingCnt=target.getBroadcastingCnt();
        this.listeningCnt=target.getListeningCnt();
        this.starCnt=target.getStarCnt();
        this.fanCnt=target.getFanCnt();
        this.noticeCnt=target.getNoticeCnt();
        this.reportCnt=target.getReportCnt();
        this.reportMemCnt=target.getReportMemCnt();

    }
}
