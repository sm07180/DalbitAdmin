package com.dalbit.customer.vo.procedure;

import com.dalbit.common.vo.ImageVo;
import com.dalbit.common.vo.SearchVo;
import com.dalbit.util.DalbitUtil;
import lombok.Getter;
import lombok.Setter;

import java.sql.Date;

@Getter
@Setter
public class P_ImageBroadcastListOutputVo extends SearchVo {

    private String mem_userid;
    private String mem_no;
    private String mem_nick;
    private String memName;
    private String mem_phone;
    private String mem_slct;
    private String mem_sex;
    private ImageVo image_background;
    private String room_no;
    private String subject_type;
    private String title;
    private String state;

    private Date start_date;
    private String start_dateFormat;



    public void setStart_date(Date start_date){
        this.start_date = start_date;
        this.start_dateFormat = DalbitUtil.convertDateFormat(start_date, "yyyy.MM.dd HH:mm:ss");
    }

    public void setImage_background(String path){
        this.image_background = new ImageVo(path, DalbitUtil.getProperty("server.photo.url"));
    }
}
