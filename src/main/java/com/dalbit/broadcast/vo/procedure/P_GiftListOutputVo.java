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
    private int level;
    private String grade;
    private Date giftDate;
    private String giftDateFormat;
    private String itemImage;
    private String itemName;
    private String item_thumbnail;
    private int accumCnt;
    private int itemCnt;

    /* summry */
    private int giftCnt;
    private int male;
    private int female;
    private int none;
    
    public void setGiftDate(Date giftDate){
        this.giftDate = giftDate;
        this.giftDateFormat = DalbitUtil.convertDateFormat(giftDate, "yyyy.MM.dd HH:mm:ss");
    }
}


