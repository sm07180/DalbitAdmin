package com.dalbit.content.vo;

import com.dalbit.common.vo.BaseVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class AlarmTalkButtonVo extends BaseVo {
    private String name; 				    //Y 버튼 제목
    private String type; 			 	        //Y 버튼 타입 [3.2.2 버튼 타입에서 확인 가능]		(웹링크 WL,앱링크 AL,배송조회 DS,봇키워드 BK,메시지전달 MD,상담톡전환 BC,봇전환 BT,채널 추가 CA)
    private String url_pc; 				    // - pc 환경에서 버튼 클릭 시 이동할 url
    private String url_mobile; 			    // - mobile 환경에서 버튼 클릭 시 이동할 url
    private String scheme_ios; 			// - mobileios 환경에서 버튼 클릭 시 실행할 applicationcustomscheme
    private String scheme_android; 		// - mobileandroid 환경에서 버튼 클릭 시 실행할 applicationcustomscheme

}

