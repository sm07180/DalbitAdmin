package com.dalbit.content.vo.procedure;

import com.dalbit.common.vo.BaseVo;
import com.dalbit.util.DalbitUtil;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class P_itemExchangeListOutputVo extends BaseVo {
    private String platform;                  //플랫폼(PC(Web포함)/Mobile-Android/Mobile-IOS)
    private String item_code;               //아이템코드
    private String item_image;              //아이템이미지경로
    private String item_thumbnail;         //썸네일이미지경로
    private String item_name;               //상품명
    private String item_type;               //아이템 타입( 신규,인기,한정)
    private int dal;                            //급 달 수량
    private int item_price;                     //아이템 가격
    private int discount_rate;                  //인율(0~100)
    private int sale_price;                     //실제 판매 가격
    private String desc;                        //상품설명
    private int view_yn;                        //게시상태(0: OFF, 1: ON)
    private int purchase_count;             //구매건수
    private String op_name;                  //처리자
    private Date regDate;                      //등록일자
    private String regDateFormat;
    private Date lastupdDate;			        //  최종 수정일자
    private String lastupdDateFormat;

    //Summary
    private int pcCnt;                          //pc게시 건수
    private int androidCnt;                   //android 게시 건수
    private int iosCnt;                         //ios 게시 건수
    private int totalPurchaseCnt;          //누적 구매 건수

    public void setRegDate(java.sql.Date regDate){
        this.regDate = regDate;
        this.regDateFormat = DalbitUtil.convertDateFormat(regDate, "yyyy.MM.dd HH.mm.ss");
    }

    public void setLastUpdDate(java.sql.Date lastupdDate){
        this.lastupdDate = lastupdDate;
        this.lastupdDateFormat = DalbitUtil.convertDateFormat(lastupdDate, "yyyy.MM.dd HH.mm.ss");
    }
}
