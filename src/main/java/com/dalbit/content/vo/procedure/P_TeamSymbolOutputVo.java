package com.dalbit.content.vo.procedure;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class P_TeamSymbolOutputVo {
    private int auto_no;            // 고유번호
    private String bg_slct;         // 배지구분[b:배경, e:테두리, m:메달]
    private String bg_slct_name;    // 배지구분명
    private String bg_code;         // 팀 배지 코드(x000 형식)
    private String bg_name;         // 배지 이름
    private String bg_conts;        // 소개
    private String bg_url;          // 배지 URL
    private int bg_cnt;             // 사용중인팀수
    private String use_yn;          // 사용여부
    private String chrgr_name;      // 등록관리자명
    private Date ins_date;          // 등록일자
    private Date upd_date;		    // 수정일자
}
