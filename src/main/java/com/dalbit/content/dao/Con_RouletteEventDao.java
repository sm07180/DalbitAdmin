package com.dalbit.content.dao;

import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.content.vo.AttendanceBonusVo;
import com.dalbit.content.vo.AttendanceCalendarVo;
import com.dalbit.content.vo.AttendanceGiftconVo;
import com.dalbit.content.vo.AttendanceVo;
import com.dalbit.content.vo.procedure.P_RouletteRateVo;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Repository
public interface Con_RouletteEventDao {

    @Transactional(readOnly = true)
    ArrayList<P_RouletteRateVo> callRouletteRate(ProcedureVo procedureVo);

    P_RouletteRateVo callEditRouletteRate(ProcedureVo procedureVo);

}
