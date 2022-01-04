package com.dalbit.content.vo.procedure;

import lombok.Data;

import java.util.Date;

@Data
public class P_ToTheMoonListOutputVo {
    private String mem_no;              // 회원 번호
    private String mem_id;              // 회원 아이디
    private String mem_nick;	        // 회원 닉네임
    private String image_profile;	    // 회원 프로필이미지
    private int mem_level;	            // 회원 레벨
    private int mem_state;	            // 회원 상태

    private int mem_basic_item_score;   // 아이템선물 점수(일반)
    private int mem_gold_item_score;    // 아이템선물 점수(보너스)
    private int mem_gold_like_score;	// 좋아요 점수(보너스)
    private int mem_gold_booster_score;	// 부스터 점수(보너스)
    private int mem_gold_mission_score; // 아이템 미션 점수(보너스)
    private int mem_cha_booster_score;  // 부스터 점수(캐릭터)
    private int mem_cha_mission_score;  // 아이템 미션 점수(캐릭터)
    private int rank_pt;				// 점수합
    private int rank_step;	            // 랭킹 단계
    private int send_like_cnt;			// 좋아요 합계
    private int view_cnt;			    // 청취시간 합계
    private int rcv_reword_cnt;			// 보상달수
    private String rcv_yn;				// 보상지급 여부
    private Date rcv_date;			    // 보상일자
}
