package com.dalbit.content.proc;

import com.dalbit.content.vo.procedure.P_KkanbuListInputVo;
import com.dalbit.content.vo.procedure.P_KkanbuMemSelInputVo;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import java.util.List;

@Component
@Repository
public interface Event_KkanbuProc {
    /**
     * 깐부 배팅리스트
     *
     * @param p_kkanbuListInputVo
     * @return
     */
    @ResultMap({"ResultMap.PKkanbuBetTotalOutputVo", "ResultMap.integer", "ResultMap.PKkanbuBetListOutputVo"})
    @Select("CALL rd_data.p_adm_evt_gganbu_mem_betting_list(#{kkanbuNo}, #{memNo}, #{pageNo}, #{pagePerCnt})")
    List<Object> getKkanbuBetList(P_KkanbuListInputVo p_kkanbuListInputVo);


    /**
     * 깐부 주머니 받은내역
     *
     * @param p_kkanbuListInputVo
     * @return
     */
    @ResultMap({"ResultMap.integer", "ResultMap.PKkanbuMarbleListOutputVo"})
    @Select("CALL rd_data.p_adm_evt_gganbu_mem_pocket_list(#{kkanbuNo}, #{memNo}, #{pageNo}, #{pagePerCnt})")
    List<Object> getKkanbuMarbleList(P_KkanbuListInputVo p_kkanbuListInputVo);

    /**
     * 깐부 주머니 받은내역 (점수)
     *
     * @param p_kkanbuListInputVo
     * @return
     */
    @ResultMap({"ResultMap.PKkanbuMarblePointTotalOutputVo", "ResultMap.integer", "ResultMap.PKkanbuMarblePointListOutputVo"})
    @Select("CALL rd_data.p_adm_evt_gganbu_mem_pocket_pt_list(#{kkanbuNo}, #{memNo}, #{pageNo}, #{pagePerCnt})")
    List<Object> getKkanbuMarblePointList(P_KkanbuListInputVo p_kkanbuListInputVo);

    /**
     * 깐부 신청내역
     *
     * @param p_kkanbuListInputVo
     * @return
     */
    @ResultMap({"ResultMap.integer", "ResultMap.PKkanbuReqListOutputVo"})
    @Select("CALL rd_data.p_adm_evt_gganbu_mem_req_list(#{kkanbuNo}, #{memNo}, #{pageNo}, #{pagePerCnt})")
    List<Object> getKkanbuReqList(P_KkanbuListInputVo p_kkanbuListInputVo);

    /**
     * 깐부 랭킹리스트
     *
     * @param p_kkanbuListInputVo
     * @return
     */
    @ResultMap({"ResultMap.integer", "ResultMap.PKkanbuRankListOutputVo"})
    @Select("CALL rd_data.p_adm_evt_gganbu_mem_rank_list(#{kkanbuNo}, #{memNo}, #{pageNo}, #{pagePerCnt})")
    List<Object> getKkanbuRankList(P_KkanbuListInputVo p_kkanbuListInputVo);

    /**
     * 깐부 회원내역 - tabSlct: m(구슬)
     *
     * @param p_kkanbuListInputVo
     * @return
     */
    @ResultMap({"ResultMap.PKkanbuMemSelOutputVo", "ResultMap.PKkanbuMemSelTotalOutputVo", "ResultMap.integer", "ResultMap.PKkanbuMemSelMarbleListOutputVo"})
    @Select("CALL rd_data.p_adm_evt_gganbu_mem_sel(#{kkanbuNo}, #{memNo}, #{tabSlct}, #{pageNo}, #{pagePerCnt})")
    List<Object> getKkanbuMemSelMarbleList(P_KkanbuMemSelInputVo p_kkanbuListInputVo);

    /**
     * 깐부 회원내역 - tabSlct: p(주머니)
     *
     * @param p_kkanbuListInputVo
     * @return
     */
    @ResultMap({"ResultMap.PKkanbuMemSelOutputVo", "ResultMap.PKkanbuMemSelTotalOutputVo", "ResultMap.integer", "ResultMap.PKkanbuMemSelMarblePointListOutputVo"})
    @Select("CALL rd_data.p_adm_evt_gganbu_mem_sel(#{kkanbuNo}, #{memNo}, #{tabSlct}, #{pageNo}, #{pagePerCnt})")
    List<Object> getKkanbuMemSelMarblePointList(P_KkanbuMemSelInputVo p_kkanbuListInputVo);
}
