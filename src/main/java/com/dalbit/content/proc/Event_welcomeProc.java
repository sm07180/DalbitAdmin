package com.dalbit.content.proc;

import com.dalbit.content.vo.procedure.*;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import java.util.List;

@Component
@Repository
public interface Event_welcomeProc {

    /**
     * 웰컴 플로팅 설정 정보
     * @return
     */
    @ResultMap({"ResultMap.string"})
    @Select("CALL rd_data.p_adm_welcome_set_sel()")
    String getSetting();

    /**
     * 웰컴 플로팅 설정 변경
     * @param pWelcomeSetInputVo
     * @return
     */
    @ResultMap({"ResultMap.integer"})
    @Select("CALL rd_data.p_adm_welcome_set_upd(#{setSlct}, #{chrgrName})")
    int modifySetting(P_WelcomeSetInputVo pWelcomeSetInputVo);

    /**
     * 신입회원 웰컴이벤트 - DJ 전체 목록
     *
     * @param pWelcomeInputVo
     * @return
     */
    @ResultMap({"ResultMap.integer", "ResultMap.P_WelcomeTotalListOutputVo"})
    @Select("CALL rd_admin.p_adm_welcome_dj_list(#{memNo}, #{tDate}, #{pageNo}, #{pagePerCnt})")
    List<Object> getWelcomeDjList(P_WelcomeInputVo pWelcomeInputVo);

    /**
     * 신입회원 웰컴이벤트 - DJ 단계 목록
     *
     * @param pWelcomeInputVo
     * @return
     */
    @ResultMap({"ResultMap.P_WelcomeStatusOutputVo", "ResultMap.integer", "ResultMap.P_WelcomeDjStepOutputVo"})
    @Select("CALL rd_admin.p_adm_welcome_dj_step_list(#{memNo}, #{tDate}, #{stepNo}, #{pageNo}, #{pagePerCnt})")
    List<Object> getWelcomeDjStepList(P_WelcomeInputVo pWelcomeInputVo);

    /**
     * 신입회원 웰컴이벤트 - 청취자 전체 목록
     *
     * @param pWelcomeInputVo
     * @return
     */
    @ResultMap({"ResultMap.integer", "ResultMap.P_WelcomeTotalListOutputVo"})
    @Select("CALL rd_admin.p_adm_welcome_mem_list(#{memNo}, #{tDate}, #{pageNo}, #{pagePerCnt})")
    List<Object> getWelcomeListenerList(P_WelcomeInputVo pWelcomeInputVo);

    /**
     * 신입회원 웰컴이벤트 - 청취자 단계 목록
     *
     * @param pWelcomeInputVo
     * @return
     */
    @ResultMap({"ResultMap.P_WelcomeStatusOutputVo", "ResultMap.integer", "ResultMap.P_WelcomeListenersStepOutputVo"})
    @Select("CALL rd_admin.p_adm_welcome_mem_step_list(#{memNo}, #{tDate}, #{stepNo}, #{pageNo}, #{pagePerCnt})")
    List<Object> getWelcomeListenerStepList(P_WelcomeInputVo pWelcomeInputVo);

    /**
     * 신입회원 웰컴이벤트 - 지급완료
     *
     * @param pWelcomeGiftInputVo
     * @return
     */
    @ResultMap({"ResultMap.integer"})
    @Update("CALL rd_admin.p_adm_welcome_user_gift_upd(#{memNo}, #{giftSlct}, #{giftCode}, #{giftName}, #{stepNo}, #{chrgrName})")
    int modifyWelcomeUserGift(P_WelcomeUserGiftInputVo pWelcomeGiftInputVo);

    /**
     * 웰컴이벤트 상품 삭제
     * @param pWelcomeGiftInputVo
     * @return
     */
    @ResultMap({"ResultMap.integer"})
    @Delete("CALL rd_admin.p_adm_welcome_gift_del(#{giftCode}, #{chrgrName})")
    int removeWelcomeGift(P_WelcomeGiftInputVo pWelcomeGiftInputVo);

    /**
     * 웰컴이벤트 상품 등록
     * @param pWelcomeGiftInputVo
     * @return
     */
    @ResultMap({"ResultMap.integer"})
    @Select("CALL rd_admin.p_adm_welcome_gift_ins(#{giftCode}, #{giftName}, #{giftCont}, #{giftDalCnt}, #{stepNo}, #{giftOrd}, #{giftSlct}, #{useYn}, #{theMonth}, #{chrgrName})")
    int createWelcomeGift(P_WelcomeGiftInputVo pWelcomeGiftInputVo);

    /**
     * 웰컴이벤트 상품 수정
     * @param pWelcomeGiftInputVo
     * @return
     */
    @ResultMap({"ResultMap.integer"})
    @Select("CALL rd_admin.p_adm_welcome_gift_upd(#{giftCode}, #{giftName}, #{giftCont}, #{giftDalCnt}, #{giftOrd}, #{useYn}, #{chrgrName})")
    int modifyWelcomeGift(P_WelcomeGiftInputVo pWelcomeGiftInputVo);

    /**
     * 웰컴이벤트 - 상품 목록
     * @param pWelcomeGiftInputVo
     * @return
     */
    @ResultMap({"ResultMap.integer", "ResultMap.P_WelcomeGiftOutputVo"})
    @Select("CALL rd_admin.p_adm_welcome_gift_list(#{stepNo}, #{giftSlct}, #{tDate}, #{pageNo}, #{pagePerCnt})")
    List<Object> getWelcomeGiftList(P_WelcomeGiftInputVo pWelcomeGiftInputVo);

    /**
     * 웰컴이벤트 - 상품 상세
     * @param pWelcomeGiftInputVo
     * @return
     */
    @ResultMap({"ResultMap.P_WelcomeGiftOutputVo"})
    @Select("CALL rd_admin.p_adm_welcome_gift_sel(#{giftCode})")
    List<Object> getWelcomeGift(P_WelcomeGiftInputVo pWelcomeGiftInputVo);

    /**
     * 웰컴이벤트 조건 삭제
     * @param pWelcomeQualifyInputVo
     * @return
     */
    @ResultMap({"ResultMap.integer"})
    @Delete("CALL rd_admin.p_adm_welcome_qualify_del(#{qualifyNo}, #{chrgrName})")
    int removeWelcomeGiftQualify(P_WelcomeQualifyInputVo pWelcomeQualifyInputVo);

    /**
     * 웰컴이벤트 조건 등록
     * @param pWelcomeQualifyInputVo
     * @return
     */
    @ResultMap({"ResultMap.integer"})
    @Insert("CALL rd_admin.p_adm_welcome_qualify_ins(#{theMonth}, #{qualifyName}, #{qualifyGubun}, #{qualifyVal}, #{qualifyStepNo}, #{qualifySlct}, #{chrgrName})")
    int createWelcomeGiftQualify(P_WelcomeQualifyInputVo pWelcomeQualifyInputVo);

    /**
     * 웰컴이벤트 조건 수정
     * @param pWelcomeQualifyInputVo
     * @return
     */
    @ResultMap({"ResultMap.integer"})
    @Update("CALL rd_admin.p_adm_welcome_qualify_upd(#{qualifyNo}, #{qualifyVal}, #{chrgrName})")
    int modifyWelcomeGiftQualify(P_WelcomeQualifyInputVo pWelcomeQualifyInputVo);

    /**
     * 웰컴이벤트 - 단계별 조건 목록 - 페이징
     * @param pWelcomeQualifyInputVo
     * @return
     */
    @ResultMap({"ResultMap.integer", "ResultMap.P_WelcomeQualifyOutputVo"})
    @Select("CALL rd_admin.p_adm_welcome_qualify_list(#{stepNo}, #{qualifySlct}, #{tDate}, #{pageNo}, #{pagePerCnt})")
    List<Object> getWelcomeGifQualifyList(P_WelcomeQualifyInputVo pWelcomeQualifyInputVo);

    /**
     * 웰컴이벤트 - 단계별 조건 상세
     * @param pWelcomeQualifyInputVo
     * @return
     */
    @ResultMap({"ResultMap.P_WelcomeGiftOutputVo"})
    @Select("CALL rd_admin.p_adm_welcome_qualify_sel(#{qualifyNo})")
    List<Object> getWelcomeGiftQualify(P_WelcomeQualifyInputVo pWelcomeQualifyInputVo);
}
