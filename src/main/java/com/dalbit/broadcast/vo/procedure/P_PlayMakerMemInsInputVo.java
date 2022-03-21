package com.dalbit.broadcast.vo.procedure;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class P_PlayMakerMemInsInputVo {
    private String memNo;       // 회원번호
    private String memNos;      // 회원번호들
    private int excCms;         // 환전수수료
    private String sDate;       // 시작일자
    private String eDate;       // 종료일자
    private String chrgrName;   // 등록관리자
}
