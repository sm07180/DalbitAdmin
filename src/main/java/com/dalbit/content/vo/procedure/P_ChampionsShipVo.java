package com.dalbit.content.vo.procedure;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class P_ChampionsShipVo {
    private Integer stepNo     ; // INT		-- 회차 번호[0:전체 1,2,3,4]
    private Integer slctNo     ; // INT		-- 1:dj,2:팬
    private Integer pageNo     ; // INT UNSIGNED	-- 페이지 번호
    private Integer pagePerCnt ; // INT UNSIGNED-- 페이지 당 노출 건수 (Limit)
}
