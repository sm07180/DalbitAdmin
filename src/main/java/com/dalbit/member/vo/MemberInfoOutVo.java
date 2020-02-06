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
    String profileImage;
    int level;
    String grade;
    int exp;


//    public MemberInfoOutVo(P_MemberInfoVo target, String Mem_no) {
//
//        this.mem_no=Mem_no;
//        this.memId=target.getMemId();
//        this.phone=target.getPhone();
//        this.passwd=target.getPasswd();
//        this.nickName=target.getNickName();
//        this.memSex=target.getMemSex();
//        this.birthYear=target.getBirthYear();
//        this.birthMonth=target.getBirthMonth();
//        this.birthDay=target.getBirthDay();
//        this.slct=target.getSlct();
//        this.adid=target.getAdid();
//        this.state=target.getState();
//        this.join_date=target.getJoin_date();
//        this.upd_date=target.getUpd_date();
//        this.name=target.getName();
//        this.email=target.getEmail();
//        this.profileImage=target.getProfileImage();
//        this.level=target.getLevel();
//        this.grade=target.getGrade();
//        this.exp=target.getExp();

//        this.mem_no=target.getMem_no();
//        this.nickNm=target.getNickName();
//        this.gender=target.getMemSex();
//        this.age=target.getAge();
//        this.memId=target.getMemId();
//        this.bgImg=new ImageVo(target.getBackgroundImage(), DalbitUtil.getProperty("server.photo.url"));
//        this.profImg=new ImageVo(target.getProfileImage(), DalbitUtil.getProperty("server.photo.url"));
//        this.profMsg=target.getProfileMsg();
//        this.level=target.getLevel();
//        this.fanCnt=target.getFanCount();
//        this.starCnt=target.getStarCount();
//        this.exp=target.getExp();
//        this.expNext=target.getExpNext();
//        this.grade=target.getGrade();
//    }
}
