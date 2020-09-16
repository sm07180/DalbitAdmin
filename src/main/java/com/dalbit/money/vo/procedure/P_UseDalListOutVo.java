package com.dalbit.money.vo.procedure;

import com.dalbit.util.DalbitUtil;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.sql.Date;

@Getter
@Setter
@ToString
public class P_UseDalListOutVo {

    private int rowNum;
    private int osType;
    private String memSlct;
    private String mem_no;
    private String mem_nick;
    private String mem_sex;
    private int memAge;
    private String gifted_memSlct;
    private String gifted_osType;
    private String gifted_mem_no;
    private String gifted_memNick;
    private String gifted_mem_sex;
    private int gifted_memAge;
    private String item_code;
    private String item_name;
    private String item_image;
    private String webp_image;
    private String item_thumbnail;
    private String secret;
    private String item_cnt;
    private String item_price;
    private Date last_upd_date;
    private String lastUpdDateFormat;
    private int inner;
    private String mem_id;
    private String mem_phone;

    private int totalCnt;

    public void setLast_upd_date(Date last_upd_date){
        this.last_upd_date = last_upd_date;
        this.lastUpdDateFormat = DalbitUtil.convertDateFormat(last_upd_date, "yyyy.MM.dd HH:mm:ss");
    }

}
