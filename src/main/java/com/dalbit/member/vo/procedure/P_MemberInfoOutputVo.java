package com.dalbit.member.vo.procedure;

import com.dalbit.common.vo.SearchVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class P_MemberInfoOutputVo extends SearchVo {

    private String profileImage;
    private String mem_no;
    private String userId;
    private String userName;
    private String socialId;
    private String phoneNum;
    private String nickName;
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

}
