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
     * ##### ???????????? ????????? ?????????????????????
     *
     * # RETURN [Multi Rows]
     *
     * #1
     * cnt                  INT		-- ?????????
     *
     * #2
     * tot_purchase_count   INT		-- ??? ????????????
     *
     * #3
     * mem_no               BIGINT		-- ????????????
     * mem_nick             VARCHAR(20)	-- ?????????
     * specialdj_cnt        SMALLCNT	-- ?????????DJ ??????
     * low_price_item       BIGINT		-- ??????????????????
     * middle_price_item    BIGINT		-- ??????????????????
     * high_price_item      BIGINT		-- ??????????????????
     * ins_date             DATETIME	-- ????????????
     * upd_date             DATETIME	-- ????????????
     */
    @Transactional(readOnly = true)
    @ResultMap({"ResultMap.integer", "ResultMap.integer", "ResultMap.P_SignatureItemGiftListOutputVo"})
    @Select("CALL rd_admin.p_adm_signature_item_list(#{pageNo}, #{pagePerCnt})")
    List<Object> pAdmSignatureItemList(Map param);

    /**
     * ##### ???????????? ????????? (???????????? memNo ????????? ????????? ?????????)
     *
     * # RETURN [Multi Rows]
     *
     * #1
     * cnt                  INT		-- ?????????
     *
     * #2
     * String item_code;            //  ???????????????
     * String item_name;            //  ???????????????
     * String item_image;           //  ?????????????????? ??????
     * String item_thumbnail;       //  ????????? ?????????????????? ??????
     * int item_price;              //  ??????(???)
     * int item_price_ios;          //  ios??????(???)
     * int byeol;                   //  ?????? ???
     * String item_type;            //  ????????? ??????( ??????,??????,??????)
     * int discount_rate;           //  ?????????
     * int sale_price;              //  ??????????????????(???)
     * int item_slct;               //  ???????????????(1: ???????????????, 2: ???????????????, 3: ??? ??????)
     * int use_area;                //  ????????????
     * String file_slct;            //  ?????? ??????( webp/jason, sticker)
     * String webp_image;           //  webp ???????????????
     * String jason_image;          //  jason ???????????????
     * int sound_yn;                //  ???????????????
     * int play_time;               //  ?????????????????????
     * String platform;             //  ?????????(PC(Web??????),Mobile-Android,Mobile-IOS)
     * String desc;                 //  ???????????????
     * int view_yn;                 //  ????????????
     * int purchase_count;          //  ????????????
     * String op_name;              //  ?????????
     * Date regDate;                //  ????????????
     * String regDateFormat;
     * Date lastupdDate;            //  ??????????????????
     * String lastupdDateFormat;
     * int ruby;                    //  ?????? ??????
     * int gold;                    //  ?????? ??????
     * int exp;                     //  ?????? ?????????
     * int order;                   //  ????????? ??????
     * int state;                   //  ??????( 1: ?????????, 2: ?????? ??????)
     * int in_app_yn;               //  ?????? ??????( 0: ??????, 1: ?????? ???????????? ?????????)
     * String tts_use_yn;           //   tts ?????? ?????? ?????? ??????
     */
    @Transactional(readOnly = true)
    @ResultMap({"ResultMap.integer", "ResultMap.P_itemGiftListOutputVo"})
    @Select("CALL rd_admin.p_adm_signature_item_mem_sel(#{memNo}, #{pageNo}, #{pagePerCnt})")
    List<Object> pAdmSignatureItemMemSel(MemSelSignatureGiftParamVo param);

}
