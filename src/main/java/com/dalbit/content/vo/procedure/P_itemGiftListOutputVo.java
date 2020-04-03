package com.dalbit.content.vo.procedure;

import com.dalbit.common.vo.BaseVo;
import com.dalbit.util.DalbitUtil;
import lombok.Getter;
import lombok.Setter;

import java.sql.Date;

@Getter
@Setter
public class P_itemGiftListOutputVo extends BaseVo {
    private int itemNo;	  		//아이템 번호
    private String itemName;	  	//아이템 이름
    private String itemImage;	  	//아이템 이미지 경로
    private int itemType;	  		//아이템타입(1: 선물, 2: 사용)
    private int ruby;	  			//소모 루비
    private int gold;	 	 		//획득 골드
    private int exp;	  			//획득 경험치
    private int order;	  			//아이템 순서
    private int state;	  			//상태( 1: 판매중, 2: 판매 중지)
}
