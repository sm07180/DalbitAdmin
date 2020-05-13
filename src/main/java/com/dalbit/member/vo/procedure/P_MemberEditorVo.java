package com.dalbit.member.vo.procedure;

import com.dalbit.common.vo.BaseVo;
import com.dalbit.common.vo.ImageVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class P_MemberEditorVo extends BaseVo {
    private String  mem_no;
    private String  reset_profileImage;
    private String  profileImage;
    private String	phoneNum;
    private String	nickName;
    private String	name;
    private String  birthDate;
    private String	memSex;
    private String	passwdReset;
    private String	photoUrl;
    private String  sendNoti;
    private String  notiContents;
    private String  notiMemo;
    private String  notiSms;
    private String  socialId;
    private String  before_socialId;
    private String  editContents;

    // 달 별 추가 Cnt
    private int beforDalCnt;
    private int afterDalCnt;
    private int addDalCnt;
    private int beforByeolCnt;
    private int afterByeolCnt;
    private int addByeolCnt;
    private String use_contents;

}

