package com.dalbit.content.vo.procedure;

import lombok.Data;

import java.util.Date;

@Data
public class P_XmasLoverListOutputVo {
    private int seq_no;         //	-- 회차 번호
    private int send_like_cnt;         //	-- 좋아요수
    private int send_like_score_cnt;         //		-- 좋아요점수
    private int send_booster_cnt;         //	-- 부스터수
    private int send_booster_score_cnt;         //	-- 부스터점수
    private int tot_score_cnt;         //	-- 총점수
    private int rcv_reword_cnt;         //		-- 보상
    private String mem_no;         //		-- 회원 번호
    private String mem_id;         //	-- 회원 아이디
    private String mem_nick;         //	-- 회원 닉네임
    private String mem_sex;         //		-- 회원성별
    private String image_profile;         //	-- 프로필
    private int mem_level;         //		-- 레벨
    private int mem_state;         //		-- 회원상태(1:정상3:블럭, 4:탈퇴, 5:영구정지...)
    private Date ins_date;         //	-- 등록일자
    private Date upd_date;         //	-- 수정일자
    private Date rcv_date;         //	-- 보상일자
}
