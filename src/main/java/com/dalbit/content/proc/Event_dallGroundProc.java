package com.dalbit.content.proc;

import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Component
@Repository
public interface Event_dallGroundProc {
    /**
     * ##### 달라그라운드 순위내역(어드민)
     */
    @ResultMap({"ResultMap.integer", "ResultMap.GroundListVo"})
    @Select("CALL rd_data.p_adm_evt_dalla_team_ground_rank_list(#{groundNo}, #{pageNo}, #{pagePerCnt})")
    List<Object> teamGroundRankList(Map<String, Object> param);
}
