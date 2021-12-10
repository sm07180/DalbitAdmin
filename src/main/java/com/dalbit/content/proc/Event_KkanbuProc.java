package com.dalbit.content.proc;

import com.dalbit.content.vo.procedure.P_KkanbuBetListInputVo;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import java.util.List;

@Component
@Repository
public interface Event_KkanbuProc {
    @ResultMap({"ResultMap.PKkanbuBetTotalOutputVo", "ResultMap.integer", "ResultMap.PKkanbuBetListOutputVo"})
    @Select("CALL rd_admin.p_adm_evt_gganbu_mem_betting_list(#{kkanbuNo}, #{pageNo}, #{pagePerCnt})")
    List<Object> getKkanbuBetList(P_KkanbuBetListInputVo p_kkanbuBetListInputVo);
}
