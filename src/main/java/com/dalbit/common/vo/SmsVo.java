package com.dalbit.common.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
public class SmsVo {

    public SmsVo(String msgBody, String phoneNo){
        setMsgBody(msgBody);
        setPhoneNo(phoneNo);
    }

    private String phoneNo; //문자받을번호
    private String msgBody; //메시지
    private String subject = ""; //제목

    //0(단문)으로 하드코딩.
    private String msgType;

    //property에서 세팅
    private String sendPhoneNo; //보낸사람번호
    private String umId;

    //Insert 후 자동생성
    private int CMID;
}
