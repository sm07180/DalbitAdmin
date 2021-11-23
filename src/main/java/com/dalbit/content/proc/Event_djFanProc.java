package com.dalbit.content.proc;

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
public interface Event_djFanProc {
    @ResultMap({"ResultMap.PDjPanPrizeFanSectionOutputVo", "ResultMap.integer", "ResultMap.PDjPanPrizeFanListOutputVo"})
    @Select("CALL rd_admin.p_adm_event_november_fan_week_list(#{memNo},#{evtNo},#{couponUseCnt},#{pageNo},#{pagePerCnt})")
    List<Object> getDjFanPrizeFanList(P_DjFanPrizeFanListInputVo pDjPanPrizeFanListInputVo);

    @ResultMap({"ResultMap.integer", "ResultMap.PDjPanPrizeFanTotalListOutputVo"})
    @Select("CALL rd_admin.p_adm_event_november_fan_list(#{memNo},#{fanGiftNo},#{pageNo},#{pagePerCnt})")
    List<Object> getDjFanPrizeFanTotalList(P_DjFanPrizeFanTotalListInputVo pDjPanPrizeFanTotalListInputVo);

    @ResultMap({"ResultMap.integer", "ResultMap.PDjPanPrizeDjListOutputVo"})
    @Select("CALL rd_admin.p_adm_event_november_dj_list(#{memNo},#{rcvDalSlct},#{pageNo},#{pagePerCnt})")
    List<Object> getDjFanPrizeDjList(P_DjFanPrizeDjListInputVo pDjPanPrizeDjListInputVo);
}
