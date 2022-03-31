package com.dalbit.content.vo.procedure;

import lombok.Data;

import java.util.Date;

@Data
public class P_WelcomeQualifyOutputVo {
    private int auto_no;            // 자동증가번호
    private String the_month;       // 경품사용월
    private String qualify_name;    // 조건 이름
    private int qualify_gubun;      // 조건구분[1:방송시청,2:좋아요,3:달충전]
    private int qualify_val;        // 조건 값
    private int qualify_step_no;    // 조건 단계
    private int qualify_slct;       // 1:dj,2:회원
    private Date ins_date;		    // 등록일자
    private Date upd_date;		    // 수정일자
    private String chrgr_name;      // 관리자명
}
