package com.dalbit.money.vo.procedure;

import com.dalbit.common.vo.PagingVo;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class P_ResourcePopupOutputVo extends PagingVo {

    private String memNo;           // 회원번호
    private String memNick;         // 회원닉네임
    private String memSex;          // 회원성별
    private String memBirthYear;    // 회원생일
    private String payDalCnt;       // 결제달
    private String payAmt;          // 결제금액
    private String payWay;          // 결제 방법
    private String payDate;         // 결제 일시
    private String updLastDate;     // 일시
    private String recvMemNo;       // 받은 회원 번호
    private String recvMemNick;     // 받은 회원 닉네임
    private String recvMemSex;      // 받은 회원 닉네임
    private String recvMemBirthYear;// 받은 회원 닉네임
    private String secret;          // 비밀선물 여부
    private String changeByeolCnt;  // 교환 별
    private String changedalCnt;    // 교환 달
    private String rewardType;      // 보상 구분
    private String giftCnt;         // 선물 수
    private String giftDalCnt;      // 선물 달수
    private String dalCnt;          // 보유달
    private String dalAmtCnt;       // 달금액
    private String byeolCnt;        // 보유별
    private String itemThumbnail;   // 아이템 이미지
    private String webpImage;       // 움직이는 아이템
    private String itemName;        // 아이템 명
    private String lastUpdDate;     // 일시
    private String inner;           // 테스트아이디
    private String recvInner;       // 받은사람테스트아이디
    private String itemCnt;         // 아이템수
    private String cancelDt;        // 결제 취소 일시
    private String memState;        // 회원상태


}