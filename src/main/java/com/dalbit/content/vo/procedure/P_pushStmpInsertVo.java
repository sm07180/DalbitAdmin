package com.dalbit.content.vo.procedure;

import com.dalbit.common.vo.BaseVo;
import com.dalbit.util.DalbitUtil;
import lombok.Getter;
import lombok.Setter;

import java.text.SimpleDateFormat;
import java.util.Date;

@Getter
@Setter
public class P_pushStmpInsertVo extends BaseVo {

    public P_pushStmpInsertVo(){}

    public P_pushStmpInsertVo(String mem_no, P_pushInsertVo pPushInsertVo){
        this.setPush_idx(pPushInsertVo.getPush_idx());
        this.setMem_no(mem_no);
        this.setTitle(pPushInsertVo.getSend_title());
        this.setContents(pPushInsertVo.getSend_cont());
        this.setEtc_contents(pPushInsertVo.getEtc_contents());
        this.setRoom_no(pPushInsertVo.getRoom_no());
        this.setBoard_idx(pPushInsertVo.getBoard_idx());
        this.setRedirect_url(pPushInsertVo.getRedirect_url());
        this.setTarget_mem_no(DalbitUtil.isEmpty(pPushInsertVo.getTarget_mem_no()) ? mem_no : pPushInsertVo.getTarget_mem_no());
        this.setImage_type(pPushInsertVo.getImage_type());
        this.setSlctPush(pPushInsertVo.getIs_all());
        this.setPush_type(pPushInsertVo.getSlct_push());
        this.setImageUrl(pPushInsertVo.getSend_url());
        this.setSend_type(DalbitUtil.isEmpty(pPushInsertVo.getSend_type()) ? "10" : pPushInsertVo.getSend_type());
        this.setPush_slct(pPushInsertVo.getPush_slct());

        if(pPushInsertVo.getPlatform().equals("110")){
            this.setSlctOs("a");
        }else if(pPushInsertVo.getPlatform().equals("101")){
            this.setSlctOs("b");
        }

        try{
            Date date = new Date();
            if(!DalbitUtil.isEmpty(pPushInsertVo.getSend_datetime())){
                date = new SimpleDateFormat("yyyyMMddHHmm").parse(pPushInsertVo.getSend_datetime());
            }
            String sendDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S").format(date);
            this.setSendDate(sendDate);
        }catch (Exception e){
            e.printStackTrace();

        }
    }

    private String mem_no;          //회원번호
    private String slctPush;        //푸시대상구분 (1: 요청회원의 팬, 11, 전체회원, 그외 해당 회원)
    private String title;               //푸시 제목
    private String contents;        //푸시 내용
    private String etc_contents;        //팝업 푸시 내용
    private String imageUrl;			// 푸시에 노출되는 이미지 경로
    private String push_type;			//푸시타입 (1 : 방송방 [room_no],2 : 메인,31 : 마이페이지>팬 보드,32 : 마이페이지>내 지갑,33 : 마이페이지>캐스트>캐스트 정보 변경 페이지,34 : 마이페이지>알림>해당 알림 글,35 : 마이페이지,36 : 레벨 업 DJ 마이페이지 [mem_no],4 : 등록 된 캐스트,5 : 스페셜 DJ 선정 페이지,6 : 이벤트 페이지>해당 이벤트 [board_idx],7 :  공지사항 페이지 [board_idx])
    private String room_no;				// DJ방생성시 방송방 번호
    private String target_mem_no;		// 타겟회원의 마이페이지 이동할 경우
    private String board_idx;			// 해당 게시판 이동할 경우
    private String redirect_url;			// 직접입력 URL
    private String sendDate;			// 발송일시
    private String etcData;             // ETC!!!!!!!!!!!!
    private String image_type;
    private String slctOs;        //OS 구분  (a: Android, b:IOS)
    private String send_type;          //발송 구분 (11: 전체, 10: 푸시, 01: 알림)

    /*
        -- push_slct
            11 : 방송 시작
            12 : DJ 레벨 업(사용안함)
            13 : 캐스트 등록, 좋아요
            14 : 방송 시작 10분 후
            15 : 회원 선물 수신
            16 : 팬 등록
            17 : 팬 보드 등록
            18 : 방송공지 등록
            19 : 생일 축하

            51 : 미접속 대상 알림
            52 : 이벤트 알림
            53 : 긴급공지
            54 : 사용자 경고
            55 : 경고 해제
            56 : 이용정지 해제
            57 : 사용자 정보 초기화
            58 : 캐스트 정보 초기화
            59 : 스페셜 DJ 선정
            60 : 1:1 문의 답변
            61 : 운영자 선물 수신
            62 : 환전 완료
            63 : 환전 취소

            92 : 운영자(회원 + 비회원)
            93 : 운영자(회원)
            94 : 운영자 (비회원)
            95 : 운영자 (테스트계정)
            96 : 운영자 (지정회원)
    */
    private String push_slct;

    private String push_idx;  //요청 push_idx
}

