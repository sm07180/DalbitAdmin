package com.dalbit.status.vo.procedure;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class P_ItemBroadTTSInputVo {
    private int slctType;           // 0: 일자별, 2: 월간별
    private String tDate;           // 검색일자
    private String ttsMsgYn;        // 메시지 사용여부
    private int pageNo;             // 페이지 번호
    private int pagePerCnt;         // 페이지 당 노출 건수 (Limit)
}