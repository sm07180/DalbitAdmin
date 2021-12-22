package com.dalbit.content.vo.procedure;

import lombok.Data;

import java.util.Date;

@Data
public class P_XmasDetailLoverScoreListOutputVo {
    private int auto_no;         //		-- 자동증가 번호
    private int seq_no;         //		-- 회차 번호
    private String mem_no;         //		-- 회원 번호
    private int score_slct;         //		-- 1:좋아요, 2: 부스터
    private int tot_cnt;         //		-- 좋아요 || 부스터 개수
    private int score_cnt;         //		-- 점수
    private String room_no;         //		-- 방송번호
    private String room_title;         //	-- 방송 제목
    private String dj_mem_no;         //		-- DJ회원 번호
    private String dj_mem_nick;         //	-- DJ회원 닉네임
    private Date ins_date;         //	-- 등록일자
}
