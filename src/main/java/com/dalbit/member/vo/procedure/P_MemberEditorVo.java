package com.dalbit.member.vo.procedure;

import com.dalbit.common.vo.BaseVo;
import com.dalbit.common.vo.ImageVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class P_MemberEditorVo extends BaseVo {
    private String  mem_no;
    private ImageVo reset_profileImage;
    private String  profileImage;
    private String	phoneNum;
    private String	nickName;
    private String	name;
    private String  birthDate;
    private String	memSex;
    private String	passwdReset;
    private String	photoUrl;
}

