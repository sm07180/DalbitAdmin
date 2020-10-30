package com.dalbit.broadcast.vo.procedure;

import com.dalbit.common.vo.PagingVo;
import com.dalbit.util.DalbitUtil;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class P_GiftListOutputVo extends PagingVo {

    /* return result */
    private String userId;
    private String nickName;
    private String mem_sex;
    private String mem_birth_year;
    private String mem_birth_month;
    private String mem_birth_day;

    private int level;
    private String grade;
    private Date giftDate;
    private String giftDateFormat;
    private String itemImage;
    private String itemCode;
    private String itemName;
    private String item_thumbnail;
    private int accumCnt;
    private int itemCnt;
    private int byeolCnt;
    private int accumByeolCnt;
    private int secret;
    private String mem_no;
    private int inner;
    private int item_type;

    /* summry */
    private int giftCnt;
    private int male;
    private int female;
    private int none;
    private int totalByeol;

    public void setGiftDate(Date giftDate){
        this.giftDate = giftDate;
        this.giftDateFormat = DalbitUtil.convertDateFormat(giftDate, "yyyy.MM.dd HH:mm:ss");
    }
}


