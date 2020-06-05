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
    private int ruby;
    private String room_no;
    private String mem_no;
    private String item_type;
    private String userId;
    private String nickName;
    private String mem_sex;
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
    // 공개 보낸 선물
    private int allGiftItemCnt;
    private int allGiftDalCnt;
    private int allReceivedItemCnt;
    private int allReceivedDalCnt;
    // 비공개 보낸 선물
    private int allGiftSecretItemCnt;
    private int allGiftSecretDalCnt;
    private int allReceivedSecretItemCnt;
    private int allReceivedSecretDalCnt;

    public void setGiftDate(Date giftDate){
        this.giftDate = giftDate;
        this.giftDateFormat = DalbitUtil.convertDateFormat(giftDate, "yyyy.MM.dd HH:mm:ss");
    }
}
