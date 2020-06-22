package com.dalbit.content.vo.procedure;

import com.dalbit.common.vo.BaseVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class P_AlarmTalkInsertVo extends BaseVo {
    private String emp_no;                  // Y 임직원번호
    private String userid;                    // Y 사용자 계정명 (비즈엠)

    private String message_type;  	    // Y 메시지 타입(AT: 알림톡,FT: 친구톡) 친구톡의 경우 20 시~08 시 발송 불가
    private String phn;  			            // Y 사용자 전화번호 (국가코드(82)를 포함한 전화번호)
    private String profile;  		            // Y 발신프로필키 (메시지 발송 주체인 카카오톡 채널 등록 후 발급되는 키)
    private String reserveDt;  		        // Y 메시지 예약발송을 위한 시간 값(yyyyMMddHHmmss) (즉시전송 :00000000000000, 예약전송 : 20180601000000) 키 타입 필수 설명
    private String msg;  			            // Y 사용자에게 전달될 메시지(공백 포함 최대 1,000 자) 친구톡 이미지 타입 : 최대 400 자 제한 친구톡 이미지 타입 와이드형 : 최대 76 자 제한
    private String title;  			            // N 템플릿 내용 중 강조 표기할 핵심 정보 (CBT, 템플릿 검수 가이드 참고)
    private String tmplId;  		            // N 메시지 유형을 확인할 템플릿 코드(사전에 승인된 템플릿의 코드) 알림톡의 경우 필수 입력
    private String smsKind;  		        // N 문자메시지 전환발송시 SMS/LMS 구분 (S:SMS,L:LMS,M:MMS,N: 발송하지 않음) SMS/LMS 대체발송 상품 이용시 사용 가능 (비즈엠 홈페이지 - 내 정보 - 이용상품에서 설정 가능)
    private String msgSms;  		        // N 카카오 비즈메시지 발송 실패 시 문자메시지 대체 발송을 위한 메시지 내용
    private String smsSender;  		    // N 문자메시지 발송을 위한 발신번호 (비즈엠 사이트에 등록 승인된 발신번호)
    private String smsLmsTit;  		        // N LMS(장문 메시지) 발송시 메시지 제목
    private String smsOnly;  		        // N 카카오 비즈메시지 발송과 관계 없이 문자메시지 전용 발송 요청 여부(Y: 사용,N: 미사용, 기본값:N) SMS/LMS 대체발송 상품 이용시 사용 가능 (비즈엠 홈페이지 - 내 정보 이용상품에서 설정 가능)
    private String ad_flag;  		            // N 친구톡 메시지 발송 시 광고성 메시지 필수 표기사항 노출여부 (Y: 노출,N: 노출하지 않음, 기본값 :Y)
    private String img_url;  		            // N 친구톡 발송 시 메시지에 첨부할 이미지 URL [4.2 친구톡 이미지 업로드]에서 확인 가능
    private String img_link;  		        // N 첨부된 이미지 클릭시 이동할 URL
    private String wide;  			        // N 친구톡 이미지 타입 와이드형 사용 여부 (Y: 사용,N: 미사용, 기본값:N) 키 타입 필수 설명

    private String button1; 			        // N 메시지에 첨부할 버튼 1
    private String button2; 			        // N 메시지에 첨부할 버튼 2
    private String button3; 			        // N 메시지에 첨부할 버튼 3
    private String button4; 			        // N 메시지에 첨부할 버튼 4
    private String button5; 			        // N 메시지에 첨부할 버튼 5

}

