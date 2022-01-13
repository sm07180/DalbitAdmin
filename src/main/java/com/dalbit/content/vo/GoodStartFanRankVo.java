package com.dalbit.content.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class GoodStartFanRankVo {
    private String good_no; // 이벤트 회차 번호
    private String mem_no; // 회원번호
    private String mem_id; // 아이디
    private String mem_sex; // 성별
    private String mem_nick; // 대화명
    private String mem_exp_score; // 경험치 점수
    private String mem_special_score; // 스페셜 점수
    private String tot_mem_score; // 총합산 점수
    private int my_rank_no = 0; // 랭킹
}
