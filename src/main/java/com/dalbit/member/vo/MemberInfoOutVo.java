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

    String mem_no;
    String memId;
    String phone;
    String passwd;
    String nickName;
    String memSex;
    String birthYear;
    String birthMonth;
    String birthDay;
    String slct;
    String adid;
    String state;
    String join_date;
    String upd_date;
    String name;
    String email;
    ImageVo profileImage;
    int age;
    int level;
    String grade;
    int exp;
    int broadcastingCnt;
    int listeningCnt;
    int starCnt;
    int fanCnt;



    public MemberInfoOutVo(P_MemberInfoVo target) {

        this.mem_no=target.getMem_no();
        this.memId=target.getMemId();
        this.phone=target.getPhone();
        this.passwd=target.getPasswd();
        this.nickName=target.getNickName();
        this.memSex=target.getMemSex();
        this.birthYear=target.getBirthYear();
        this.birthMonth=target.getBirthMonth();
        this.birthDay=target.getBirthDay();
        this.slct=target.getSlct();
        this.adid=target.getAdid();
        this.state=target.getState();
        this.join_date=target.getMem_join_date();
        this.upd_date=target.getLast_upd_date();
        this.name=target.getName();
        this.email=target.getEmail();
        this.profileImage=new ImageVo(target.getProfileImage(), DalbitUtil.getProperty("server.photo.url"));
        this.age=DalbitUtil.ageCalculation(Integer.parseInt(target.getBirthYear()));
        this.level=target.getLevel();
        this.grade=target.getGrade();
        this.exp=target.getExp();
        this.broadcastingCnt=target.getBroadcastingCnt();
        this.listeningCnt=target.getListeningCnt();
        this.starCnt=target.getStarCnt();
        this.fanCnt=target.getFanCnt();

    }
}
