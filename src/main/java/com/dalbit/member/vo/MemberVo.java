package com.dalbit.member.vo;

import com.dalbit.common.vo.BaseVo;
import com.dalbit.common.vo.ImageVo;
import com.dalbit.security.vo.InforexLoginLayoutVo;
import lombok.Getter;
import lombok.Setter;
import lombok.var;
import org.springframework.security.core.context.SecurityContextHolder;

import java.sql.Date;

@Getter
@Setter
public class MemberVo{

    private static final long serialVersionUID = 1L;

    public static String getMyMemNo() {
        var inforexLoginLayoutVo = (InforexLoginLayoutVo) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        return inforexLoginLayoutVo.getUserInfo().getName();
    }

    private String memNo;
    private String memNick;
    private String memSex;
    private int age;
    private String memId;
    private ImageVo backgroundImage;
    private ImageVo profileImage;
    private String profileMsg;
    private int level;
    private String grade;
    private int exp;
    private int expNext;

    private int fanCount;
    private int starCount;
    private boolean enableFan;

    private int idx;
    private String memPhone;
    private String memPasswd;
    private int memBirthYear;
    private int memBirthMonth;
    private int memBirthDay;
    private String memSlct;
    private String memState;
    private Date memJoinDate;
    private Date lastUpdDate;
}
