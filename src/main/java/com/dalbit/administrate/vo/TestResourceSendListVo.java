package com.dalbit.administrate.vo;

import com.dalbit.common.vo.PagingVo;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class TestResourceSendListVo extends PagingVo {

    private int item_type;
    private int ruby;
    private String room_no;
    private String title;
    private String mem_no;
    private String giftDate;
    private String secret;
    private String itemImage;
    private String itemName;
    private String itemCnt;
    private String item_thumbnail;
    private int inner;

    private int gold;
    private String lastUpdDate;

}
