package com.dalbit.content.proc;

import com.dalbit.content.vo.procedure.P_ToTheMoonInputVo;
import com.dalbit.content.vo.procedure.P_WelcomeGiftInputVo;
import com.dalbit.content.vo.procedure.P_WelcomeInputVo;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import java.util.List;

@Component
@Repository
public interface Event_tothemoonProc {

    /**
     * 캐릭터보상 목록
     *
     * @param pToTheMoonInputVo
     * @return
     */
    @ResultMap({"ResultMap.P_ToTheMoonStatusVo", "ResultMap.integer", "ResultMap.P_ToTheMoonListOutputVo"})
    @Select("CALL rd_data.p_adm_evt_moon_rank_list(#{moonNo}, #{memNo}, #{pageNo}, #{pagePerCnt})")
    List<Object> getToTheMoonList(P_ToTheMoonInputVo pToTheMoonInputVo);
}
