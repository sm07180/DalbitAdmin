package com.dalbit.content.proc;

import com.dalbit.content.vo.procedure.P_DrawEventListInputVo;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import java.util.List;

@Component
@Repository
public interface Event_drawProc {
    @ResultMap({"ResultMap.integer", "ResultMap.PDrawEventListOutputVo"})
    @Select("CALL rd_admin.p_adm_evt_bbopgi_use_log_list(#{memNo},#{bbopgiGiftSlct},#{startDate},#{endDate},#{pageNo},#{pagePerCnt})")
    List<Object> getDrawList(P_DrawEventListInputVo pDrawEventListInputVo);
}
