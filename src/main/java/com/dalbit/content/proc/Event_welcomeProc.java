package com.dalbit.content.proc;

import com.dalbit.content.vo.procedure.*;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import java.util.List;

@Component
@Repository
public interface Event_welcomeProc {

    /**
     * 신입회원 웰컴이벤트 - DJ 전체 목록
     *
     * @param pWelcomeInputVo
     * @return
     */
    @ResultMap({"ResultMap.integer", "ResultMap.P_WelcomeTotalListOutputVo"})
    @Select("CALL rd_admin.p_adm_welcome_dj_list(#{memNo}, #{pageNo}, #{pagePerCnt})")
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
    @Select("CALL rd_admin.p_adm_welcome_mem_list(#{memNo}, #{pageNo}, #{pagePerCnt})")
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
    @Update("CALL rd_admin.p_adm_welcome_gift_upd(#{memNo}, #{giftSlct}, #{giftCode}, #{giftName}, #{stepNo}, #{chrgrName})")
    int modifyWelcomeGift(P_WelcomeGiftInputVo pWelcomeGiftInputVo);

}
