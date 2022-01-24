package com.dalbit.status.proc;

import com.dalbit.status.vo.procedure.P_LevelInputVo;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import java.util.List;

@Component
@Repository
public interface P_Level {

    @ResultMap({"ResultMap.integer", "ResultMap.P_LevelListOutputVo"})
    @Select("CALL rd_admin.p_adm_mem_level_stat_list(#{chrgrYn})")
    List<Object> memLevelStatList(P_LevelInputVo pLevelInputVo);



}
