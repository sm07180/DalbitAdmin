package com.dalbit.content.dao;

import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.content.vo.GiftOrder;
import com.dalbit.content.vo.MemSelSignatureGiftParamVo;
import com.dalbit.content.vo.procedure.*;
import org.apache.ibatis.annotations.ResultMap;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.apache.ibatis.annotations.Select;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Repository
public interface ItemDao {

    @Transactional(readOnly = true)
    ArrayList<P_itemChargeListOutputVo> callContentsChargeItemList(ProcedureVo procedureVo);

    @Transactional(readOnly = true)
    P_itemChargeDetailOutputVo callContentsChargeItemDetail(ProcedureVo procedureVo);

    ProcedureVo callContentsChargeItemAdd(ProcedureVo procedureVo);
    ProcedureVo callContentsChargeItemEdit(ProcedureVo procedureVo);
    ProcedureVo callContentsChargeItemDelete(ProcedureVo procedureVo);

    @Transactional(readOnly = true)
    ArrayList<P_itemExchangeListOutputVo> callContentsExchangeItemList(ProcedureVo procedureVo);

    @Transactional(readOnly = true)
    P_itemExchangeDetailOutputVo callContentsExchangeItemDetail(ProcedureVo procedureVo);

    ProcedureVo callContentsExchangeItemAdd(ProcedureVo procedureVo);
    ProcedureVo callContentsExchangeItemEdit(ProcedureVo procedureVo);
    ProcedureVo callContentsExchangeItemDelete(ProcedureVo procedureVo);

    @Transactional(readOnly = true)
    ArrayList<P_itemGiftListOutputVo> callContentsGiftItemList(ProcedureVo procedureVo);
    @Transactional(readOnly = true)
    P_itemGiftDetailOutputVo callContentsGiftItemDetail(ProcedureVo procedureVo);

    ProcedureVo callContentsGiftItemAdd(ProcedureVo procedureVo);
    ProcedureVo callContentsGiftItemEdit(ProcedureVo procedureVo);
    ProcedureVo callContentsGiftItemDelete(ProcedureVo procedureVo);

    @Transactional(readOnly = true)
    ArrayList<P_itemGiftListOutputVo> callServiceCenterItemGiftList(ProcedureVo procedureVo);

    @Transactional(readOnly = true)
    ArrayList<P_QuickListOutputVo> getQuickList();

    @Transactional(readOnly = true)
    ArrayList<GiftOrder> getGiftOrderList(GiftOrder GiftOrder);

    int setGiftOrderList(GiftOrder GiftOrder);

    @Transactional(readOnly = true)
    List<Long> getSignatureGiftItemList();

    /**
     * ##### 시그니처 아이템 보유회원리스트
     *
     * # RETURN [Multi Rows]
     *
     * #1
     * cnt                  INT		-- 총건수
     *
     * #2
     * tot_purchase_count   INT		-- 총 선물현황
     *
     * #3
     * mem_no               BIGINT		-- 회원번호
     * mem_nick             VARCHAR(20)	-- 대화명
     * specialdj_cnt        SMALLCNT	-- 스페셜DJ 횟수
     * low_price_item       BIGINT		-- 저가아이템수
     * middle_price_item    BIGINT		-- 중가아이템수
     * high_price_item      BIGINT		-- 고가아이템수
     * ins_date             DATETIME	-- 등록일자
     * upd_date             DATETIME	-- 수정일자
     */
    @Transactional(readOnly = true)
    @ResultMap({"ResultMap.integer", "ResultMap.integer", "ResultMap.P_SignatureItemGiftListOutputVo"})
    @Select("CALL rd_admin.p_adm_signature_item_list(#{pageNo}, #{pagePerCnt})")
    List<Object> pAdmSignatureItemList(Map param);

    /**
     * ##### 시그니처 아이템 (특정유저 memNo 조건의 아이템 리스트)
     *
     * # RETURN [Multi Rows]
     *
     * #1
     * cnt                  INT		-- 총건수
     *
     * #2
     * String item_code;            //  아이템코드
     * String item_name;            //  아이템이름
     * String item_image;           //  아이템이미지 경로
     * String item_thumbnail;       //  아이템 썸네일이미지 경로
     * int item_price;              //  가격(달)
     * int item_price_ios;          //  ios가격(달)
     * int byeol;                   //  얻는 별
     * String item_type;            //  아이템 타입( 신규,인기,한정)
     * int discount_rate;           //  할인율
     * int sale_price;              //  실제판매가격(달)
     * int item_slct;               //  아이템구분(1: 방송방선물, 2: 방송방사용, 3: 달 선물)
     * int use_area;                //  사용영역
     * String file_slct;            //  파일 구분( webp/jason, sticker)
     * String webp_image;           //  webp 이미지경로
     * String jason_image;          //  jason 이미지경로
     * int sound_yn;                //  사운드여부
     * int play_time;               //  애니플레이시간
     * String platform;             //  플랫폼(PC(Web포함),Mobile-Android,Mobile-IOS)
     * String desc;                 //  아이템설명
     * int view_yn;                 //  게시여부
     * int purchase_count;          //  구매건수
     * String op_name;              //  등록자
     * Date regDate;                //  등록일자
     * String regDateFormat;
     * Date lastupdDate;            //  최종변경일자
     * String lastupdDateFormat;
     * int ruby;                    //  소모 루비
     * int gold;                    //  획득 골드
     * int exp;                     //  획득 경험치
     * int order;                   //  아이템 순서
     * int state;                   //  상태( 1: 판매중, 2: 판매 중지)
     * int in_app_yn;               //  인앱 여부( 0: 아님, 1: 인앱 다운로드 아이템)
     * String tts_use_yn;           //   tts 음성 사용 가능 여부
     */
    @Transactional(readOnly = true)
    @ResultMap({"ResultMap.integer", "ResultMap.P_itemGiftListOutputVo"})
    @Select("CALL rd_admin.p_adm_signature_item_mem_sel(#{memNo}, #{pageNo}, #{pagePerCnt})")
    List<Object> pAdmSignatureItemMemSel(MemSelSignatureGiftParamVo param);

}
