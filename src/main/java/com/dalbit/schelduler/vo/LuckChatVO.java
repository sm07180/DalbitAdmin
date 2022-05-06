package com.dalbit.schelduler.vo;

import lombok.Data;
import lombok.Getter;

import java.util.Date;

@Data
public class LuckChatVO {

    @Getter
    public static class RewardItemInfo {
        private String the_date = ""; //		DATE			-- 집계일자
        private String pre_code = ""; //		CHAR(3)			-- 보상코드
        private String pre_slct = ""; //		CHAR(1)			-- 보상구분[r:캐럿, k:현물]
        private String code_comm = ""; //		VARCHAR(30)		-- 보상이름
        private Integer pre_cnt = 0; //			INT			-- 보상갯수
        private Integer pre_mem_cnt = 0; //		INT			-- 일별 최대 보상가능수
        private Integer rcv_mem_cnt = 0; //		INT			-- 보상받은회원수
    }

    @Getter
    public static class RewardUserInfo {
        private String the_date; //		DATE			-- 집계일자
        private Integer the_seq = 0; //			TINYINT			-- 회차
        private String mem_no = "0"; //			INT			-- 회원번호
        private String mem_userid; //			VARCHAR(20)		-- 회원아이디
        private String mem_nick; //		VARCHAR(40)		-- 회원대화명
        private Integer chat_cnt; //		INT			-- 채팅수
        private String today_rcv_yn; //		INT			-- 오늘보상 수령여부
        private Date ins_date; //		DATETIME		-- 등록일자
        private Date upd_date; //		DATETIME		-- 수정일자
    }
}
