package com.dalbit.customer.vo;

import com.dalbit.common.vo.PagingVo;
import com.dalbit.util.DalbitUtil;
import lombok.Getter;
import lombok.Setter;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;

@Getter
@Setter
public class SmsHistoryVo extends PagingVo {

    /* input */
    private String searchText;
    private String txt_startSel;
    private String txt_endSel;

    private List<HashMap> mem_nos;
    private int is_all;
    private int is_direct;
    private String logDateTableName;
    private int tabType;            // 1: 인증번호 2: 가상계좌 3: ETC 7: 운영자

    /* output */
    private String cmid;
    private String umid;
    private String msg_type;
    private String status;
    private String request_time;
    private String send_time;
    private String report_time;
    private String dest_phone;
    private String dest_name;
    private String send_phone;
    private String send_name;
    private String subject;
    private String msg_body;
    private String wap_url;
    private String cover_flag;
    private String sms_flag;
    private String reply_flag;
    private String retry_cnt;
    private String fax_file;
    private String vxml_file;
    private String call_status;
    private String use_page;
    private String use_time;
    private String sn_result;
    private String wap_info;
    private String cinfo;
    private String mem_no;

    private String mem_id;
    private String mem_name;
    private String mem_nick;
    private String mem_userid;
    private String mem_memSex;
    private String mem_level;
    private String mem_grade;

    public void setReport_time(Date last_upd_date){
        this.report_time = DalbitUtil.convertDateFormat(last_upd_date, "yyyy.MM.dd HH:mm:ss");
    }

    public void setSend_time(Date last_upd_date){
        this.report_time = DalbitUtil.convertDateFormat(last_upd_date, "yyyy.MM.dd HH:mm:ss");
    }

    public void setSend_time(String last_upd_date){
        this.send_time = last_upd_date;
    }
}
