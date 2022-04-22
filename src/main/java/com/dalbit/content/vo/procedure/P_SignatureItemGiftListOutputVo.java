package com.dalbit.content.vo.procedure;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class P_SignatureItemGiftListOutputVo {
    private Long mem_no;                     //  BIGINT		-- 회원번호
    private Long low_price_item;             //  BIGINT		-- 저가아이템수
    private Long middle_price_item;          //  BIGINT		-- 중가아이템수
    private Long high_price_item;            //  BIGINT		-- 고가아이템수
    private Integer specialdj_cnt;           //  SMALLCNT	-- 스페셜DJ 횟수
    private String mem_nick;                 //  VARCHAR(20)	-- 대화명
    private String ins_date;                 //  DATETIME	-- 등록일자
    private String upd_date;                 //  DATETIME	-- 수정일자
}
