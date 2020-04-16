package com.dalbit.content.vo.procedure;

import com.dalbit.common.vo.BaseVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class P_pushStmpInsertVo extends BaseVo {

    public P_pushStmpInsertVo(){}

    public P_pushStmpInsertVo(String mem_no, P_pushInsertVo pPushInsertVo){
        this.setMem_no(mem_no);
        this.setTitle(pPushInsertVo.getSend_title());
        this.setContents(pPushInsertVo.getSend_cont());
        this.setSlctPush(pPushInsertVo.getSlct_push());
    }

    private String mem_no;          //회원번호
    private String slctPush;        //푸시타입 (1 : 마이 스타 알림, 2 : 선물 받은 달 알림, 3 : 팬 알림, 4 : 댓글 알림, 5 : 달빛 라이브 알림, 6 : 이벤트 및 마케팅 정보 수신)
    private String title;               //푸시 제목
    private String contents;        //푸시 내용
    private String imageUrl;			// 푸시에 노출되는 이미지 경로
    private String push_type;			// 푸시 클릭시 이동 구분 타입
    private String room_no;				// DJ방생성시 방송방 번호
    private String target_mem_no;		// 타겟회원의 마이페이지 이동할 경우
    private String board_idx;			// 해당 게시판 이동할 경우
}

