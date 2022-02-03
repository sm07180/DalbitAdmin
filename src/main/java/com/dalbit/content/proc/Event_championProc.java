package com.dalbit.content.proc;

import com.dalbit.content.vo.procedure.P_ChampionsShipVo;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import java.util.List;

@Component
@Repository
public interface Event_championProc {

    @ResultMap({"ResultMap.integer", "ResultMap.ChampionshipVo"})
    @Select("CALL rd_admin.p_adm_championship_list(#{stepNo}, #{slctNo}, #{pageNo}, #{pagePerCnt})")
    List<Object> championshipList(P_ChampionsShipVo p_championsShipVo);
}
