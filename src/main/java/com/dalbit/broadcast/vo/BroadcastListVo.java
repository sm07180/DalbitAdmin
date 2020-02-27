package com.dalbit.broadcast.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BroadcastListVo {

    /*  intput  */
    private String search;
    private String date;
    private String gubun;
    private String type;                    // 방송주제타입
    private String value;                   // 방송 주제 타입 값
    private String stDate;
    private String edDate;
    private String CheckDate;            //기간 선택 여부

    /* return result */
    private String roomNo;                  //방번호
    private String title;                   //제목
    private String msgWelcom;              //환영 인사말
    private String typeEntry;              //입장제한
    private String notice;                  //공지사항
    private String state;                   //방상태
    private String start_date;              //시작일시
    private String memNo;                   //DJ 회원번호
    private String memNick;                //DJ 닉네임
    private String memId;                   //DJ ID
    private String memSex;                  //DJ 성별
    private int count_entry;                // 누적입장수
    private int count_good;                 // 좋아요 수

    public void setStDate(String stDate){
        this.stDate = stDate.replace("-","");
    }

    public void setEdDate(String edDate){
        this.edDate = edDate.replace("-","");
    }
}