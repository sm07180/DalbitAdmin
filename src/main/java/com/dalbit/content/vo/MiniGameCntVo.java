package com.dalbit.content.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MiniGameCntVo {
   private Integer m_totalPayAmt;  // BIGINT		-- 달(소진)
   private Integer m_totalGoCnt;   // BIGINT		-- 게임진행횟수
   private Integer m_freeCnt;      // BIGINT		-- 무료
   private Integer m_payCnt;       // BIGINT		-- 유료
   private Integer m_totalDalCnt;  // BIGINT		-- 등록건수

}
