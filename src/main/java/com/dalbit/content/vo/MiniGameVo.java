package com.dalbit.content.vo;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class MiniGameVo {
    private String create_date;      //DATETIME	-- 방송방 시작일자
    private String game_no;  //	BIGINT		-- 게임번호
    private String room_no;  //	BIGINT		-- 방번호
    private String mem_no;  //	BIGINT		-- 회원번호
    private String title;  //	VARCAHR	-- 방송방 제목
    private String state;  //	BIGINT -- 방송방 상태
    private String start_date;   //	DATETIME	--방송방 시작일자
    private String end_date;  //	DATETIME	-- 방송방 종료일자
    private String subjectType;    //	VARCAHR	-- 방송방 카테고리
    private String os_type;      //	BIGINT		-- OS타입
    private String mem_nick;     // VARCAHR	-- 회원 닉네임
    private String mem_sex;      //	CAHR		-- 회원 성별
    private String mem_birth_year;    //VARCAHR	-- 회원 생년
    private String pay_yn;      //  BIGINT		-- 금액설정
    private String go_cnt;      //  BIGINT		-- 게임진행횟수
    private String last_upd_date;      //	DATETIME	-- 마지막수정일자

}
