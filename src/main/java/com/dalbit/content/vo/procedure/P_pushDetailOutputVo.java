package com.dalbit.content.vo.procedure;

import com.dalbit.common.vo.BaseVo;
import com.dalbit.member.vo.procedure.P_MemberListOutputVo;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class P_pushDetailOutputVo extends BaseVo {
    private String push_idx;                //푸시번호
    private String platform;        //플랫폼
    private String status;             //방송상태
    private String send_title;      //메시지 제목
    private String send_cont;       //메시지 내용
    private String send_url;        //이미지URL
    private String is_all;             //수신대상전체여부
    private String mem_nos;         //회원번호s
    private String msg_type;           //메시지 구분
    private String slct_push;           //푸시 구분
    private String is_direct;          //즉시발송여부
    private String send_cnt;          //발송건수 (전체 :-1, 지정: 지정건수)
    private String send_datetime;     //발송시작일시
    private String reg_date;          //등록일
    private String op_name;         //등록자
    private String link_url;         //이동 링크
    private String target_info;
    private String image_type;

    private List<P_MemberListOutputVo> mem_info;        //수신대상정보
}
