package com.dalbit.content.vo.procedure;

import com.dalbit.common.vo.BaseVo;
import com.dalbit.util.DalbitUtil;
import lombok.Getter;
import lombok.Setter;

import java.sql.Date;

@Getter
@Setter
public class P_pushListOutputVo extends BaseVo {
    private int push_idx;                //푸시번호
    private String platform;        //플랫폼
    private int status;             //방송상태
    private String send_title;      //메시지 제목
    private String send_cont;       //메시지 내용
    private String send_url;        //이미지URL
    private int is_all;             //수신대상전체여부
    private String mem_nos;         //회원번호s
    private int msg_type;           //메시지 구분
    private int slct_push;           //푸시 구분
    private int is_direct;          //즉시발송여부
    private int is_noti;          //알림 발송 여부
    private String send_type;          //발송 구분 (11: 전체, 10: 푸시, 01: 알림)
    private int send_cnt;          //발송건수 (전체 :-1, 지정: 지정건수)
    private Date send_datetime;     //발송시작일시
    private String send_datetimeFormat;     //발송시작일시
    private Date reg_date;          //등록일
    private String reg_dateFormat;          //등록일
    private String op_name;         //등록자
    private String link_url;         //이동 링크
    private String target_info;
    private int image_type;
    private String push_slct;
    private int reservationCnt;

    public void setReg_date(java.sql.Date reg_date){
        this.reg_date = reg_date;
        this.reg_dateFormat = DalbitUtil.convertDateFormat(reg_date, "yyyy.MM.dd HH:mm:ss");
    }

    public void setSend_datetime(java.sql.Date send_datetime){
        this.send_datetime = send_datetime;
        this.send_datetimeFormat = DalbitUtil.convertDateFormat(send_datetime, "yyyy.MM.dd HH:mm:ss");
    }
}
