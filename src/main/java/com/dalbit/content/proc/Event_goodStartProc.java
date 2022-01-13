package com.dalbit.content.proc;

import com.dalbit.content.vo.*;
import com.dalbit.content.vo.procedure.P_DjFanPrizeDjListInputVo;
import com.dalbit.content.vo.procedure.P_DjFanPrizeFanListInputVo;
import com.dalbit.content.vo.procedure.P_DjFanPrizeFanTotalListInputVo;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import java.util.List;

@Component
@Repository
public interface Event_goodStartProc {
    /**
     * 굿스타트 이벤트 회차 정보
     * @param noSlct - 일정구분[1:해당회차, 2,전체회차]
     * @return noSlct -> 1: vo, 2: list
     *   good_no, start_date, end_date, ins_date
     */
    @Select("CALL rd_data.p_evt_good_start_no_sel(#{noSlct})")
    List<GoodStartNoInfoVo> goodStartNoSel(String noSlct);

    /**
     * 굿스타트 이벤트 dj 랭킹
     */
    @ResultMap({"ResultMap.integer", "ResultMap.GoodStartDjRankVo"})
    @Select("CALL rd_data.p_adm_evt_good_start_bj_list(#{goodNo}, #{memNo}, #{bjSlct}, #{pageNo}, #{pagePerCnt})")
    List<Object> goodStartDjList(GoodStartDataInputVo goodStartDataInputVo);

    // dj 특정 회원 조회
    @Select("CALL rd_data.p_adm_evt_good_start_bj_sel(#{goodNo}, #{memNo}, #{bjSlct})")
    GoodStartDjRankVo goodStartBjSel(GoodStartDataInputVo goodStartDataInputVo);

    /**
     * 굿스타트 이벤트 fan 랭킹
     */
    @ResultMap({"ResultMap.integer", "ResultMap.GoodStartFanRankVo"})
    @Select("CALL rd_data.p_adm_evt_good_start_fan_list(#{goodNo}, #{memNo}, #{pageNo}, #{pagePerCnt})")
    List<Object> goodStartFanList(GoodStartDataInputVo goodStartDataInputVo);

    // fan 특정 회원 조회
    @Select("CALL rd_data.p_adm_evt_good_start_fan_sel(#{goodNo}, #{memNo})")
    GoodStartFanRankVo goodStartFanSel(GoodStartDataInputVo goodStartDataInputVo);

    /**
     * 굿스타트 이벤트 특별점수 상새 내역
     */
    @Select("CALL rd_data.p_adm_evt_good_start_fan_special_sel(#{goodNo}, #{memNo})")
    List<GoodStartFanSpecialVo> goodStartFanSpecialSel(GoodStartDataInputVo goodStartDataInputVo);
}
