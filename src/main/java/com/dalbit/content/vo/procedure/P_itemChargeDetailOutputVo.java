package com.dalbit.content.vo.procedure;

import com.dalbit.common.vo.BaseVo;
import com.dalbit.util.DalbitUtil;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class P_itemChargeDetailOutputVo extends BaseVo {
    private String item_code;					// 아이템 코드
    private String item_name;					// 아이템 이름
    private String item_image;					// 아이템 이미지 경로
    private String item_thumbnail;			// 아이템 썸네일이미지 경로
    private int item_price;						// 가격
    private int item_price_ios;					// ios 적용 가격
    private String item_type;					// 아이템 타입( 신규,인기,한정)
    private int discount_rate;					// 할인율
    private int sale_price;						// 판매가격
    private int dal;							        // 지급 달 수량
    private String platform;					    // 플랫폼(PC(Web포함)/Mobile-Android/Mobile-IOS)
    private String desc;						    // 상품 설명
    private int view_yn;						    // 게시여부
    private int main_yn;						    // 메인노출
    private int purchase_count;				// 구매건수
    private String op_name;					// 처리자 이름
    private Date reg_date;						// 등록 일자
    private String reg_dateFormat;
    private Date lastUpdDate;			        //  최종 수정일자
    private String lastUpdDateFormat;


    public void setRegDate(java.sql.Date reg_date){
        this.reg_date = reg_date;
        this.reg_dateFormat = DalbitUtil.convertDateFormat(reg_date, "yyyy.MM.dd HH.mm.ss");
    }

    public void setLastUpdDate(java.sql.Date lastUpdDate){
        this.lastUpdDate = lastUpdDate;
        this.lastUpdDateFormat = DalbitUtil.convertDateFormat(lastUpdDate, "yyyy.MM.dd HH.mm.ss");
    }
}
