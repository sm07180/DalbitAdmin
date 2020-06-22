package com.dalbit.content.vo;

import com.dalbit.common.vo.BaseVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class AlarmTalkValVo extends BaseVo {
    private String web_male_cnt;				    // 웹 남 가입수
    private String web_female_cnt;				// 웹 여 가입수
    private String mobile_male_cnt;				// 모바일 남 가입수
    private String mobile_female_cnt;			// 모바일 여 가입수
    private String connect_member_cnt;		// 비중복 접속자
    private String connect_nonmem_cnt;		// 비회원 접속자
    private String connect_30_cnt;				// 30분 접속자
    private String connect_10_cnt;				// 10분 접속자
    private String broadcast_create_cnt;		// 방 개설 수
    private String broadcast_listener_cnt;		// 시청자 수
    private String payment_cnt;					// 결제건수
    private String payment_amt;					// 결제 금액 (천원단위 절삭)
    private String dal_pay_amt;					// 달 구매개수
    private String dal_use_amt;					// 달 사용개수

}

