package com.dalbit.member.vo.procedure;

import com.dalbit.common.vo.SearchVo;
import com.dalbit.util.DalbitUtil;
import lombok.Getter;
import lombok.Setter;

import java.sql.Date;

@Getter
@Setter
public class P_MemberExchangeOutputVo extends SearchVo {

    //output
    private String gubun;
    private int ruby;
    private String room_no;
    private String mem_no;
    private String item_type;
    private String userId;
    private String nickName;
    private int level;
    private String grade;
    private Date giftDate;
    private String giftDateFormat;
    private String itemImage;
    private String itemName;
    private int itemCnt;
    private String item_thumbnail;
    private int secret;

    //summary
    private int giftCnt;
    private int dalCnt;

    public void setGiftDate(Date giftDate){
        this.giftDate = giftDate;
        this.giftDateFormat = DalbitUtil.convertDateFormat(giftDate, "yyyy.MM.dd HH:mm:ss");
    }
}
