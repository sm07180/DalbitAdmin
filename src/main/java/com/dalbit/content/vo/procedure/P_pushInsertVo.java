package com.dalbit.content.vo.procedure;

import com.dalbit.common.vo.BaseVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class P_pushInsertVo extends BaseVo {
    private String mem_no; 		//회원번호
    private String slctPush; 		//푸시타입 (1 : 마이 스타 알림, 2 : 선물 받은 달 알림, 3 : 팬 알림, 4 : 댓글 알림, 5 : 달빛 라이브 알림, 6 : 이벤트 및 마케팅 정보 수신)
    private String title; 		//푸시 제목
    private String contents; 		//푸시 내용
}

