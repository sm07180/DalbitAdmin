package com.dalbit.content.vo.procedure;

import com.dalbit.common.vo.BaseVo;
import com.dalbit.util.DalbitUtil;
import lombok.Getter;
import lombok.Setter;

import java.sql.Date;

@Getter
@Setter
public class P_itemGiftListOutputVo extends BaseVo {

    private String item_code;			//아이템코드
    private String item_name;			//아이템이름
    private String item_image;			//아이템이미지 경로
    private String item_thumbnail;		//아이템 썸네일이미지 경로
    private int item_price;				//가격(달)
    private int item_price_ios;			//ios가격(달)
    private int byeol;					//얻는 별
    private String item_type;			//아이템 타입( 신규,인기,한정)
    private int discount_rate;			//할인율
    private int sale_price;				//실제판매가격(달)
    private int item_slct;				//아이템구분(1: 방송방선물, 2: 방송방사용, 3: 달 선물)
    private int use_area;				//사용영역
    private String file_slct;			//파일 구분( webp/jason, sticker)
    private String webp_image;			//webp 이미지경로
    private String jason_image;			//jason 이미지경로
    private int sound_yn;			    //사운드여부
    private int play_time;				//애니플레이시간
    private String platform;			//플랫폼(PC(Web포함),Mobile-Android,Mobile-IOS)
    private String desc;				//아이템설명
    private int view_yn;				//게시여부
    private int purchase_count;			//구매건수
    private String op_name;				//등록자
    private Date regDate;				//등록일자
    private String regDateFormat;
    private Date lastupdDate;			//최종변경일자
    private String lastupdDateFormat;
    private int ruby;					//소모 루비
    private int gold;					//획득 골드
    private int exp;					//획득 경험치
    private int order;					//아이템 순서
    private int state;					//상태( 1: 판매중, 2: 판매 중지)
    private int in_app_yn;				//인앱 여부( 0: 아님, 1: 인앱 다운로드 아이템)
    private String tts_use_yn;          // tts 음성 사용 가능 여부


    //Summary
    private int totalGiftCnt;       //누적 선물 건수




    public void setRegDate(java.sql.Date regDate){
        this.regDate = regDate;
        this.regDateFormat = DalbitUtil.convertDateFormat(regDate, "yyyy.MM.dd HH:mm:ss");
    }

    public void setLastupdDate(java.sql.Date lastupdDate){
        this.lastupdDate = lastupdDate;
        this.lastupdDateFormat = DalbitUtil.convertDateFormat(lastupdDate, "yyyy.MM.dd HH:mm:ss");
    }

}
