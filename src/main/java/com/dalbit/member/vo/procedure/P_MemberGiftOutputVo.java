package com.dalbit.member.vo.procedure;

import com.dalbit.common.vo.SearchVo;
import com.dalbit.util.DalbitUtil;
import lombok.Getter;
import lombok.Setter;

import java.sql.Date;

@Getter
@Setter
public class P_MemberGiftOutputVo extends SearchVo {

    //output
    private String gubun;
    private String ruby;
    private String room_no;
    private String gifted_mem_no;
    private String item_type;
    private String userId;
    private String nickName;
    private int level;
    private String grade;
    private Date giftDate;
    private String giftDateFormat;
    private String itemImage;
    private String itemName;
    private int accumCnt;

    //summary

    public void setGiftDate(Date giftDate){
        this.giftDate = giftDate;
        this.giftDateFormat = DalbitUtil.convertDateFormat(giftDate, "yyyy.MM.dd HH:mm:ss");
    }
}
