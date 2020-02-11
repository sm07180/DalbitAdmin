package com.dalbit.broadcast.vo;

import com.dalbit.common.vo.ImageVo;
import com.dalbit.util.DalbitUtil;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BroadcastInfoOutVo {

    /*  intput  */
    private String roomNo;

    /* return result */
    private ImageVo backgroundImage;            // 배경이미지
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
    private String typeEntry;                   //입장제한
    private String platform;                    //플랫폼
    private String freezing;                    //얼리기여부
    private String forceExit;                   //방송강제종료
    private String infoEditDate;                //최근정보수정일시
    private String infoEditNm;                  //최근정보수정처리자
    private int goodCnt;                        // 좋아요 수
    private int menagerCnt;                     // 메니저 수
    private int giftCnt;                        // 받은 선물 수
    private int guestCnt;                       // 게스트/게스트ID 수
    private int contentsCnt;                    // 받은 사연 수
    private int banCnt;                         // 등록 금지어 수
    private int listenCnt;                      // 청취자 수
    private int forceKickCnt;                   // 강제퇴장회원 수

    public BroadcastInfoOutVo(BroadcastInfoVo target) {
        this.roomNo=target.getRoomNo();
        this.backgroundImage=new ImageVo(target.getBackgroundImage(), DalbitUtil.getProperty("server.photo.url"));
        this.type=target.getType();
        this.title=target.getTitle();
        this.memNo=target.getMemNo();
        this.memId=target.getMemId();
        this.memNick=target.getMemNick();
        this.memSex=target.getMemSex();
        this.msgWelcom=target.getMsgWelcom();
        this.state=target.getState();
        this.liveSt=target.getLiveSt();
        this.liveEd=target.getLiveEd();
        this.typeEntry=target.getTypeEntry();
        this.platform=target.getPlatform();
        this.freezing=target.getFreezing();
        this.forceExit=target.getForceExit();
        this.infoEditDate=target.getInfoEditDate();
        this.infoEditNm=target.getInfoEditNm();
        this.goodCnt=target.getGoodCnt();
        this.menagerCnt=target.getMenagerCnt();
        this.giftCnt=target.getGiftCnt();
        this.guestCnt=target.getGuestCnt();
        this.contentsCnt=target.getContentsCnt();
        this.banCnt=target.getBanCnt();
        this.listenCnt=target.getListenCnt();
        this.forceKickCnt=target.getForceKickCnt();

    }
}