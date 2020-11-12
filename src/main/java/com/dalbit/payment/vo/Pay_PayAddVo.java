package com.dalbit.payment.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
public class Pay_PayAddVo {

    private String order_id;
    private String mem_no;
    private String pay_way;
    private String pay_dt_comein;
    private String pay_yn = "y";
    private String okDate;
    private String pay_ok_date;
    private String pay_ok_time;
    private int pay_amt;
    private int item_amt;
    private String item_code;
    private String pay_info = "admin";
    private String pay_ip;
    private String login_media = "2";
    private String app_version;
    private String bill_id = "admin";
    private String service_id = "com.inforex.iosRadio";
    private int os = 2;
    private int dal_cnt;
    private String dal_yn = "y";


}