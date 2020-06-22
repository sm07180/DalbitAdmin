package com.dalbit.common.code;

import lombok.Getter;

@Getter
public enum AlarmTalkTemplate {

    //포토 배경 이미지 PREFIX
    알림톡_테스트001("alimtalktest_001",
            "[카카오뮤직] 회원가입 안내\n" +
            "#{고객명}님, 카카오뮤직\n" +
            "회원이 되신 것을 환영합니다.\n" +
            "▶신규 가입 회원 혜택\n" +
            "#{1 개월 무료 스트리밍 서비스\n" +
            "제공}\n" +
            "#{카카오톡 이모티콘 증정}"
    ),
    알림톡_달빛라이브_직원관리용_CONT1("dalbit_manage_cont_1",
            "웹 남/여: #{1} / #{2}\n" +
            "모 가입: #{3} / #{4}\n" +
            "접속: #{5} / #{6}\n" +
            "접속 30/10: #{7} / #{8}\n" +
            "방송: #{9}\n" +
            "시청: #{10}\n" +
            "결제: #{11} / #{12}\n" +
            "달: #{13} / #{14}"
    ),
   ;

    final private String id;
    final private String msg;

    AlarmTalkTemplate(String id, String msg){
        this.id = id;
        this.msg = msg;
    }
}
