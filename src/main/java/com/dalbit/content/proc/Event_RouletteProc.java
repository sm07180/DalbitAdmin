package com.dalbit.content.proc;

import com.dalbit.content.vo.RouletteApplyVo;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import java.util.List;

@Component
@Repository
public interface Event_RouletteProc {

    @ResultMap({"ResultMap.integer", "ResultMap.RouletteApplyVo"})
    @Select("CALL rd_admin.p_adm_roulette_mem_list(#{memId},#{itemSlct}, #{startDate}, #{endDate}, #{pageNo}, #{pageCnt})")
    List<Object> rouletteMemList(RouletteApplyVo rouletteApplyVo);
}
