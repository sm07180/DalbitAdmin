package com.dalbit.content.proc;

import com.dalbit.content.vo.MiniGameListVo;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface Event_miniGameProc {

    @ResultMap({"ResultMap.MiniGameCntVo", "ResultMap.integer", "ResultMap.MiniGameVo"})
    @Select("CALL rd_admin.p_adm_minigame_list(#{searchVal}, #{searchSlct}, #{ordSlct}, #{dateSlct}, #{tDate}, #{pageNo}, #{pageCnt})")
    List<Object> miniGameMonth(MiniGameListVo miniGameListVo);
}