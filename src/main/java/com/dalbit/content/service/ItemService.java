package com.dalbit.content.service;

import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.common.vo.PagingVo;
import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.content.dao.ItemDao;
import com.dalbit.content.vo.GiftOrder;
import com.dalbit.content.vo.MemSelSignatureGiftParamVo;
import com.dalbit.content.vo.procedure.*;
import com.dalbit.member.vo.MemberVo;
import com.dalbit.util.DBUtil;
import com.dalbit.util.GsonUtil;
import com.google.gson.Gson;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
@Service
public class ItemService {

    @Autowired
    ItemDao itemDao;

    @Autowired
    GsonUtil gsonUtil;

    public String callServiceCenterItemGiftList(P_itemGiftListInputVo pItemGiftListInputVo) {
        ProcedureVo procedureVo = new ProcedureVo(pItemGiftListInputVo);

        ArrayList<P_itemGiftListOutputVo> noticeList = itemDao.callServiceCenterItemGiftList(procedureVo);

        String result;

        if(Integer.parseInt(procedureVo.getRet()) > 0) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.선물아이템조회_성공, noticeList, new PagingVo(procedureVo.getRet())));
        }else if(Status.선물아이템조회_데이터없음.getMessageCode().equals(procedureVo.getRet())){
            result = gsonUtil.toJson(new JsonOutputVo(Status.선물아이템조회_데이터없음));
        }else{
            result = gsonUtil.toJson(new JsonOutputVo(Status.선물아이템조회_에러));
        }

        return result;
    }

/** ==----------------------------------------- 충전 아이템 ------------------------------------------------------------------*/

    /** 충전 아이템 리스트 */
    public String callContentsChargeItemList(P_itemChargeListInputVo pItemChargeListInputVo) {
        ProcedureVo procedureVo = new ProcedureVo(pItemChargeListInputVo);

        ArrayList<P_itemChargeListOutputVo> chargeList = itemDao.callContentsChargeItemList(procedureVo);
        P_itemChargeListOutputVo summary = new Gson().fromJson(procedureVo.getExt(), P_itemChargeListOutputVo.class);

        String result;

        if(Integer.parseInt(procedureVo.getRet()) > 0) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.충전아이템조회_성공, chargeList, new PagingVo(procedureVo.getRet()), summary));
        }else if(Status.충전아이템조회_데이터없음.getMessageCode().equals(procedureVo.getRet())){
            result = gsonUtil.toJson(new JsonOutputVo(Status.충전아이템조회_데이터없음));
        }else{
            result = gsonUtil.toJson(new JsonOutputVo(Status.충전아이템조회_에러));
        }

        return result;
    }

    /** 충전 아이템 상세 */
    public String callContentsChargeItemDetail(P_itemChargeDetailInputVo pItemChargeDetailInputVo) {
        ProcedureVo procedureVo = new ProcedureVo(pItemChargeDetailInputVo);

        itemDao.callContentsChargeItemDetail(procedureVo);
        P_itemChargeDetailOutputVo chargeDetail = new Gson().fromJson(procedureVo.getExt(), P_itemChargeDetailOutputVo.class);

        String result;

         if(Status.충전아이템상세조회_성공.getMessageCode().equals(procedureVo.getRet())) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.충전아이템상세조회_성공, chargeDetail));
        } else if(Status.충전아이템상세조회_상품코드없음.getMessageCode().equals(procedureVo.getRet())) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.충전아이템상세조회_상품코드없음));
        } else {
            result = gsonUtil.toJson(new JsonOutputVo(Status.충전아이템상세조회_에러));
        }

        return result;
    }

    /**
     * 충전 아이템 등록
     */
    public String callContentsChargeItemAdd(P_itemChargeInsertVo pItemChargeInsertVo){
        pItemChargeInsertVo.setOpName(MemberVo.getMyMemNo());

        ProcedureVo procedureVo = new ProcedureVo(pItemChargeInsertVo, true);

        itemDao.callContentsChargeItemAdd(procedureVo);

        String result;
        if(Status.충전아이템등록_성공.getMessageCode().equals(procedureVo.getRet())){
            result = gsonUtil.toJson(new JsonOutputVo(Status.충전아이템등록_성공));
        } else {
            result = gsonUtil.toJson(new JsonOutputVo(Status.충전아이템등록_실패));
        }

        return result;
    }

    /**
     * 충전 아이템 수정
     */
    public String callContentsChargeItemEdit(P_itemChargeUpdateVo pItemChargeUpdateVo) {
        pItemChargeUpdateVo.setOpName(MemberVo.getMyMemNo());
        ProcedureVo procedureVo = new ProcedureVo(pItemChargeUpdateVo, true);

        itemDao.callContentsChargeItemEdit(procedureVo);
        String result;
        if(Status.충전아이템수정_성공.getMessageCode().equals(procedureVo.getRet())){
            result = gsonUtil.toJson(new JsonOutputVo(Status.충전아이템수정_성공));
        } else if(Status.충전아이템수정_실패.getMessageCode().equals(procedureVo.getRet())){
            result = gsonUtil.toJson(new JsonOutputVo(Status.충전아이템수정_실패));
        } else {
            result = gsonUtil.toJson(new JsonOutputVo(Status.충전아이템수정_에러));
        }

        return result;
    }

    /**
     * 충전 아이템 삭제
     */
    public String callContentsChargeItemDelete(P_itemChargeDeleteVo pItemChargeDeleteVo) {
        pItemChargeDeleteVo.setOpName(MemberVo.getMyMemNo());

        int sucCnt=0;
        int failCnt=0;

        String result="";

        String[] idxs = pItemChargeDeleteVo.getItem_code().split(",");
        for(int i=0; i < idxs.length; i++) {
            ProcedureVo procedureVo = new ProcedureVo(new P_itemChargeDeleteVo(idxs[i]));

            itemDao.callContentsChargeItemDelete(procedureVo);

            if (Status.충전아이템삭제_성공.getMessageCode().equals(procedureVo.getRet())) {
                sucCnt++;
            } else {
                failCnt++;
            }
        }

        HashMap resultMap = new HashMap();
        resultMap.put("sucCnt", sucCnt);
        resultMap.put("failCnt", failCnt);

        if(0 < sucCnt){
            result = gsonUtil.toJson(new JsonOutputVo(Status.충전아이템삭제_성공, resultMap));
        }else{
            result = gsonUtil.toJson(new JsonOutputVo(Status.충전아이템삭제_실패, resultMap));
        }

        return result;
    }



/** ==----------------------------------------- 교환 아이템 ------------------------------------------------------------------*/

    /** 교환 아이템 리스트 */
    public String callContentsExchangeItemList(P_itemExchangeListInputVo pItemExchangeListInputVo) {
        ProcedureVo procedureVo = new ProcedureVo(pItemExchangeListInputVo);

        ArrayList<P_itemExchangeListOutputVo> exchangeList = itemDao.callContentsExchangeItemList(procedureVo);
        P_itemExchangeListOutputVo summary = new Gson().fromJson(procedureVo.getExt(), P_itemExchangeListOutputVo.class);

        String result;

        if(Integer.parseInt(procedureVo.getRet()) > 0) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.교환아이템조회_성공, exchangeList, new PagingVo(procedureVo.getRet()), summary));
        }else if(Status.교환아이템조회_데이터없음.getMessageCode().equals(procedureVo.getRet())){
            result = gsonUtil.toJson(new JsonOutputVo(Status.교환아이템조회_데이터없음));
        }else{
            result = gsonUtil.toJson(new JsonOutputVo(Status.교환아이템조회_에러));
        }

        return result;
    }

    /** 교환 아이템 상세 */
    public String callContentsExchangeItemDetail(P_itemExchangeDetailInputVo pItemExchangeDetailInputVo) {
        ProcedureVo procedureVo = new ProcedureVo(pItemExchangeDetailInputVo);

        itemDao.callContentsExchangeItemDetail(procedureVo);
        P_itemExchangeDetailOutputVo exchangeDetail = new Gson().fromJson(procedureVo.getExt(), P_itemExchangeDetailOutputVo.class);

        String result;

        if(Status.교환아이템상세조회_성공.getMessageCode().equals(procedureVo.getRet())) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.교환아이템상세조회_성공, exchangeDetail));
        } else if(Status.교환아이템상세조회_상품코드없음.getMessageCode().equals(procedureVo.getRet())) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.교환아이템상세조회_상품코드없음));
        } else {
            result = gsonUtil.toJson(new JsonOutputVo(Status.교환아이템상세조회_에러));
        }

        return result;
    }

    /**
     * 교환 아이템 등록
     */
    public String callContentsExchangeItemAdd(P_itemExchangeInsertVo pItemExchangeInsertVo){
        pItemExchangeInsertVo.setOpName(MemberVo.getMyMemNo());

        ProcedureVo procedureVo = new ProcedureVo(pItemExchangeInsertVo, true);

        itemDao.callContentsExchangeItemAdd(procedureVo);

        String result;
        if(Status.교환아이템등록_성공.getMessageCode().equals(procedureVo.getRet())){
            result = gsonUtil.toJson(new JsonOutputVo(Status.교환아이템등록_성공));
        }else if(Status.교환아이템등록_플랫폼미선택.getMessageCode().equals(procedureVo.getRet())) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.교환아이템등록_플랫폼미선택));
        }else if(Status.교환아이템등록_IOS미지원.getMessageCode().equals(procedureVo.getRet())) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.교환아이템등록_IOS미지원));
        }else {
            result = gsonUtil.toJson(new JsonOutputVo(Status.교환아이템등록_실패));
        }

        return result;
    }

    /**
     * 교환 아이템 수정
     */
    public String callContentsExchangeItemEdit(P_itemExchangeUpdateVo pItemExchangeUpdateVo) {
        pItemExchangeUpdateVo.setOpName(MemberVo.getMyMemNo());
        ProcedureVo procedureVo = new ProcedureVo(pItemExchangeUpdateVo, true);

        itemDao.callContentsExchangeItemEdit(procedureVo);
        String result;
        if(Status.교환아이템수정_성공.getMessageCode().equals(procedureVo.getRet())){
            result = gsonUtil.toJson(new JsonOutputVo(Status.교환아이템수정_성공));
        } else if(Status.교환아이템수정_아이템코드없음.getMessageCode().equals(procedureVo.getRet())){
            result = gsonUtil.toJson(new JsonOutputVo(Status.교환아이템수정_아이템코드없음));
        }else if(Status.교환아이템수정_플랫폼미선택.getMessageCode().equals(procedureVo.getRet())) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.교환아이템수정_플랫폼미선택));
        }else if(Status.교환아이템수정_IOS미지원.getMessageCode().equals(procedureVo.getRet())) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.교환아이템수정_IOS미지원));
        } else {
            result = gsonUtil.toJson(new JsonOutputVo(Status.교환아이템수정_에러));
        }

        return result;
    }

    /**
     * 교환 아이템 삭제
     */
    public String callContentsExchangeItemDelete(P_itemExchangeDeleteVo pItemExchangeDeleteVo) {
        pItemExchangeDeleteVo.setOpName(MemberVo.getMyMemNo());

        int sucCnt=0;
        int failCnt=0;

        String result="";

        String[] idxs = pItemExchangeDeleteVo.getItem_code().split(",");
        for(int i=0; i < idxs.length; i++) {
            ProcedureVo procedureVo = new ProcedureVo(new P_itemExchangeDeleteVo(idxs[i]));

            itemDao.callContentsExchangeItemDelete(procedureVo);

            if (Status.교환아이템삭제_성공.getMessageCode().equals(procedureVo.getRet())) {
                sucCnt++;
            } else {
                failCnt++;
            }
        }

        HashMap resultMap = new HashMap();
        resultMap.put("sucCnt", sucCnt);
        resultMap.put("failCnt", failCnt);

        if(0 < sucCnt){
            result = gsonUtil.toJson(new JsonOutputVo(Status.교환아이템삭제_성공, resultMap));
        }else{
            result = gsonUtil.toJson(new JsonOutputVo(Status.교환아이템삭제_실패, resultMap));
        }

        return result;
    }

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
    public String getSignatureList(P_itemGiftListInputVo pItemGiftListInputVo) {
        try {
            Map<String, Object> param = new HashMap<>();
            P_itemGiftListOutputVo summary = new P_itemGiftListOutputVo();
            param.put("pageNo", pItemGiftListInputVo.getPageNo());
            param.put("pagePerCnt", 50);

            List<Object> list = itemDao.pAdmSignatureItemList(param);

            if(list.equals(null)){
                return gsonUtil.toJson(new JsonOutputVo(Status.선물아이템조회_에러));
            }

            List<Integer> list_cnt = DBUtil.getList(list, Integer.class, 0);  // 리스트 cnt
            List<Integer> list_purchageCnt = DBUtil.getList(list, Integer.class, 1);  // 상단 누적 선물 갯수;
            List<P_SignatureItemGiftListOutputVo> giftList = DBUtil.getList(list, P_SignatureItemGiftListOutputVo.class);

            if(list_cnt.size() == 0 || list_purchageCnt.size() == 0){
                summary.setTotalGiftCnt(0);
                return gsonUtil.toJson(new JsonOutputVo(Status.선물아이템조회_성공, new ArrayList<>(), new PagingVo(0), summary));
            }

            Integer cnt = list_cnt.get(0);
            Integer purchageCnt = list_purchageCnt.get(0);
            summary.setTotalGiftCnt(purchageCnt);

            if (cnt > 0) {
                return gsonUtil.toJson(new JsonOutputVo(Status.선물아이템조회_성공, giftList, new PagingVo(cnt), summary));
            } else if (cnt == 0) {
                summary.setTotalGiftCnt(0);
                return gsonUtil.toJson(new JsonOutputVo(Status.선물아이템조회_성공, new ArrayList<>(), new PagingVo(0), summary));
            } else {
                return gsonUtil.toJson(new JsonOutputVo(Status.선물아이템조회_에러));
            }

        } catch (Exception e) {
            return gsonUtil.toJson(new JsonOutputVo(Status.선물아이템조회_에러));
        }
    }

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
    public String getMemSelSignatureList(MemSelSignatureGiftParamVo paramVo){
        try{
            List<Object> list = itemDao.pAdmSignatureItemMemSel(paramVo);
            Integer cnt = DBUtil.getData(list, Integer.class);
            List<P_itemGiftListOutputVo> giftList = DBUtil.getList(list, P_itemGiftListOutputVo.class);

            if(cnt> 0) {
                return gsonUtil.toJson(new JsonOutputVo(Status.선물아이템조회_성공, giftList, new PagingVo(cnt)));
            } else if (cnt == 0) {
                return gsonUtil.toJson(new JsonOutputVo(Status.선물아이템조회_데이터없음));
            } else {
                return gsonUtil.toJson(new JsonOutputVo(Status.선물아이템조회_에러));
            }
        } catch (Exception e) {
            return gsonUtil.toJson(new JsonOutputVo(Status.선물아이템조회_에러));
        }
    }

/** ==----------------------------------------- 선물 아이템 ------------------------------------------------------------------*/

    /** 선물 아이템 리스트 */
    public String callContentsGiftItemList(P_itemGiftListInputVo pItemGiftListInputVo) {
        ProcedureVo procedureVo = new ProcedureVo(pItemGiftListInputVo);

        ArrayList<P_itemGiftListOutputVo> giftList = itemDao.callContentsGiftItemList(procedureVo);
        P_itemGiftListOutputVo summary = new Gson().fromJson(procedureVo.getExt(), P_itemGiftListOutputVo.class);

        String result;

        if(Integer.parseInt(procedureVo.getRet()) > 0) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.선물아이템조회_성공, giftList, new PagingVo(procedureVo.getRet()), summary));
        }else if(Status.선물아이템조회_데이터없음.getMessageCode().equals(procedureVo.getRet())){
            result = gsonUtil.toJson(new JsonOutputVo(Status.선물아이템조회_데이터없음));
        }else{
            result = gsonUtil.toJson(new JsonOutputVo(Status.선물아이템조회_에러));
        }

        return result;
    }

    /** 선물 아이템 상세 */
    public String callContentsGiftItemDetail(P_itemGiftDetailInputVo pItemGiftDetailInputVo) {
        ProcedureVo procedureVo = new ProcedureVo(pItemGiftDetailInputVo);

        itemDao.callContentsGiftItemDetail(procedureVo);
        P_itemGiftDetailOutputVo giftDetail = new Gson().fromJson(procedureVo.getExt(), P_itemGiftDetailOutputVo.class);

        String result;

        if(Status.선물아이템상세조회_성공.getMessageCode().equals(procedureVo.getRet())) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.선물아이템상세조회_성공, giftDetail));
        } else if(Status.선물아이템상세조회_상품코드없음.getMessageCode().equals(procedureVo.getRet())) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.선물아이템상세조회_상품코드없음));
        } else {
            result = gsonUtil.toJson(new JsonOutputVo(Status.선물아이템상세조회_에러));
        }

        return result;
    }

    /**
     * 선물 아이템 등록
     */
    public String callContentsGiftItemAdd(P_itemGiftInsertVo pItemGiftInsertVo){
        pItemGiftInsertVo.setOpName(MemberVo.getMyMemNo());

        // 시그니처 아이템 회원번호 없을시 초기화
        if(StringUtils.equals(pItemGiftInsertVo.getSgnt_mem_no(), "")){
            pItemGiftInsertVo.setSgnt_mem_no("0");
        }
        
        ProcedureVo procedureVo = new ProcedureVo(pItemGiftInsertVo, true);

        itemDao.callContentsGiftItemAdd(procedureVo);

        String result;
        if(Status.선물아이템등록_성공.getMessageCode().equals(procedureVo.getRet())){
            result = gsonUtil.toJson(new JsonOutputVo(Status.선물아이템등록_성공));
        } else if(Status.선물아이템등록_플랫폼미선택.getMessageCode().equals(procedureVo.getRet())){
            result = gsonUtil.toJson(new JsonOutputVo(Status.선물아이템등록_플랫폼미선택));
        } else if(Status.선물아이템등록_아이템구분미선택.getMessageCode().equals(procedureVo.getRet())){
            result = gsonUtil.toJson(new JsonOutputVo(Status.선물아이템등록_아이템구분미선택));
        } else if(Status.선물아이템등록_아이템가격미입력.getMessageCode().equals(procedureVo.getRet())){
            result = gsonUtil.toJson(new JsonOutputVo(Status.선물아이템등록_아이템가격미입력));
        } else if(Status.선물아이템등록_지급별수량미입력.getMessageCode().equals(procedureVo.getRet())){
            result = gsonUtil.toJson(new JsonOutputVo(Status.선물아이템등록_지급별수량미입력));
        } else{
            result = gsonUtil.toJson(new JsonOutputVo(Status.선물아이템등록_실패));
        }

        return result;
    }

    /**
     * 선물 아이템 수정
     */
    public String callContentsGiftItemEdit(P_itemGiftUpdateVo pItemGiftUpdateVo) {
        pItemGiftUpdateVo.setOpName(MemberVo.getMyMemNo());

        // 시그니처 아이템 회원번호 없을시 초기화
        if(StringUtils.equals(pItemGiftUpdateVo.getSgnt_mem_no(), "")){
            pItemGiftUpdateVo.setSgnt_mem_no("0");
        }

        ProcedureVo procedureVo = new ProcedureVo(pItemGiftUpdateVo, true);

        itemDao.callContentsGiftItemEdit(procedureVo);
        String result;
        if(Status.선물아이템수정_성공.getMessageCode().equals(procedureVo.getRet())){
            result = gsonUtil.toJson(new JsonOutputVo(Status.선물아이템수정_성공));
        } else if(Status.선물아이템수정_아이템코드미입력.getMessageCode().equals(procedureVo.getRet())){
            result = gsonUtil.toJson(new JsonOutputVo(Status.선물아이템수정_아이템코드미입력));
        } else if(Status.선물아이템수정_플랫폼미선택.getMessageCode().equals(procedureVo.getRet())){
            result = gsonUtil.toJson(new JsonOutputVo(Status.선물아이템수정_플랫폼미선택));
        } else if(Status.선물아이템수정_아이템구분미선택.getMessageCode().equals(procedureVo.getRet())){
            result = gsonUtil.toJson(new JsonOutputVo(Status.선물아이템수정_아이템구분미선택));
        } else if(Status.선물아이템수정_아이템가격미입력.getMessageCode().equals(procedureVo.getRet())){
            result = gsonUtil.toJson(new JsonOutputVo(Status.선물아이템수정_아이템가격미입력));
        } else if(Status.선물아이템수정_지급별수량미입력.getMessageCode().equals(procedureVo.getRet())){
            result = gsonUtil.toJson(new JsonOutputVo(Status.선물아이템수정_지급별수량미입력));
        } else {
            result = gsonUtil.toJson(new JsonOutputVo(Status.선물아이템수정_에러));
        }

        return result;
    }

    /**
     * 선물 아이템 삭제
     */
    public String callContentsGiftItemDelete(P_itemGiftDeleteVo pItemGiftDeleteVo) {
        pItemGiftDeleteVo.setOpName(MemberVo.getMyMemNo());

        int sucCnt=0;
        int failCnt=0;

        String result="";

        String[] idxs = pItemGiftDeleteVo.getItem_code().split(",");
        for(int i=0; i < idxs.length; i++) {
            ProcedureVo procedureVo = new ProcedureVo(new P_itemGiftDeleteVo(idxs[i]));

            itemDao.callContentsGiftItemDelete(procedureVo);

            if (Status.선물아이템삭제_성공.getMessageCode().equals(procedureVo.getRet())) {
                sucCnt++;
            } else {
                failCnt++;
            }
        }

        HashMap resultMap = new HashMap();
        resultMap.put("sucCnt", sucCnt);
        resultMap.put("failCnt", failCnt);

        if(0 < sucCnt){
            result = gsonUtil.toJson(new JsonOutputVo(Status.선물아이템삭제_성공, resultMap));
        }else{
            result = gsonUtil.toJson(new JsonOutputVo(Status.선물아이템삭제_실패, resultMap));
        }

        return result;
    }



    /** 퀵 메시지 목록 */
    public String getQuickList() {
        ArrayList<P_QuickListOutputVo> list = itemDao.getQuickList();

        String result;
        result = gsonUtil.toJson(new JsonOutputVo(Status.조회, list, new PagingVo(0)));

        return result;
    }

    /* 아이템 순서 변경 목록 */
    public String getGiftOrderList(GiftOrder giftOrder) {
        ArrayList<GiftOrder> list = itemDao.getGiftOrderList(giftOrder);

        String result;
        result = gsonUtil.toJson(new JsonOutputVo(Status.조회, list, new PagingVo(0)));

        return result;
    }

    /* 아이템 순서 변경 */
    public String setGiftOrderList(GiftOrder giftOrder) {

        for(int i=0;i<giftOrder.getEditData().size();i++) {
            GiftOrder setGiftOrder = new GiftOrder();
            setGiftOrder.setItem_code(giftOrder.getEditData().get(i).get("item_code"));
            setGiftOrder.setOrder(Integer.parseInt(giftOrder.getEditData().get(i).get("itemOrder")));

            itemDao.setGiftOrderList(setGiftOrder);
        }

        return gsonUtil.toJson(new JsonOutputVo(Status.수정));
    }

}


