package com.dalbit.schelduler.vo;

import lombok.Data;

@Data
public class DallaEventMessage {
    private String title = ""; // 이벤트 메시지 타이틀
    private String content = ""; // 이벤트 메시지 내용
    private String linkTitle = ""; // 이벤트 링크 버튼 타이틀
    private String linkUrl = ""; // 이벤트 Path
    private String nickName = ""; // 이벤트 대상 회원 닉네임
    private String type = "normal"; // 이벤트 메시지 타입
}
