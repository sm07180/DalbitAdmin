package com.dalbit.broadcast.vo;

import com.dalbit.member.vo.PagingVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BroadcastListVo extends PagingVo {

    /*  intput  */
    private String search;
    private String searchBroad;             // 방송 검색 명
    private String date;
    private String gubun;
    private String gubunBroad;              // 방송구분
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
    private String startDate;              //시작일시
    private String memNo;                   //DJ 회원번호
    private String memNick;                //DJ 닉네임
    private String memId;                   //DJ ID
    private String memSex;                  //DJ 성별
    private String imageProfile;            //DJ 프로필
    private String backgroundImage;         //배경이미지

    private String badgeRecomm;             //  추천 뱃찌
    private String badgePopular;            //  인기뱃찌
    private String badgeNewdj;              //  신입뱃찌
    private String expectedEndDate;         //  방송 예상 종료 시간
    private String lastUpdDate;             //  최종변경일자
    private String tag;                     //  최종변경일자

    private String entryCnt;                // 누적입장수
    private String goodCnt;                 // 좋아요 수
    private String storyCnt;                // 사연 수
    private String giftCnt;                 // 선물 수


    public void setStDate(String stDate){
        this.stDate = stDate.replace("-","");
    }
    public void setEdDate(String edDate){
        this.edDate = edDate.replace("-","");
    }
}