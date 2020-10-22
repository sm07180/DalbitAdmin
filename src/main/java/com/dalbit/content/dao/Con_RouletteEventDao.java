package com.dalbit.content.dao;

import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.content.vo.*;
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

    @Transactional(readOnly = true)
    ArrayList<RouletteApplyVo> selectRouletteApplyList(RouletteApplyVo rouletteApplyVo);

    @Transactional(readOnly = true)
    int selectRouletteApplyCnt(RouletteApplyVo rouletteApplyVo);
}
