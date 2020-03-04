package com.dalbit.broadcast.vo;

import com.dalbit.common.vo.ImageVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BroadcastInfoVo {

    /*  intput  */
    private String roomNo;

    /* return result */
    private String backgroundImage;            //배경이미지
    private String type;                        //방송주제
    private String title;                       //방송제목
    private String memNo;                       //DJ 회원번호
    private String memId;                       //DJ ID
    private String memNick;                     //DJ 닉네임
    private String memSex;                      //DJ 성별
    private String msgWelcom;                   //환영 인사말
    private String state;                       //방송상태
    private String liveSt;                      //방송시작일
    private String liveEd;                      //방송종료일
    private int typeEntry;                      //입장제한
    private String platform;                    //플랫폼
    private String freezing;                    //얼리기여부
    private String forceExit;                   //방송강제종료
    private String infoEditDate;                //최근정보수정일시
    private String infoEditNm;                  //최근정보수정처리자
    private int goodCnt;                        // 좋아요 수
    private int managerCnt;                     // 메니저 수
    private int giftCnt;                        // 받은 선물 수
    private int manegerCnt;                     // 메니저 수
    private String guestNo;                     // 게스트 번호
    private String guestId;                     // 게스트 ID
    private String guestNick;                   // 게스트 닉네임
    private String guestOn;                     // 게스트 여부
    private int contentsCnt;                    // 받은 사연 수
    private int banCnt;                         // 등록 금지어 수
    private int listenCnt;                      // 청취자 수
    private int forceKickCnt;                   // 강제퇴장회원 수

}