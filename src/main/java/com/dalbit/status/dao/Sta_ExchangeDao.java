package com.dalbit.status.dao;

import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.status.vo.procedure.P_ExchangeGenderOutDetailVo;
import com.dalbit.status.vo.procedure.P_ExchangeTotalOutDetailVo;
import com.dalbit.status.vo.procedure.P_ExchangeWeekOutDetailVo;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;

@Repository
public interface Sta_ExchangeDao {

    @Transactional(readOnly = true)
    ArrayList<P_ExchangeTotalOutDetailVo> callExchangeTotal(ProcedureVo procedureVo);

    @Transactional(readOnly = true)
    ArrayList<P_ExchangeTotalOutDetailVo> callExchangeMonth(ProcedureVo procedureVo);

    @Transactional(readOnly = true)
    ArrayList<P_ExchangeGenderOutDetailVo> callExchangeGender(ProcedureVo procedureVo);

    @Transactional(readOnly = true)
    ArrayList<P_ExchangeWeekOutDetailVo> callExchangeWeek(ProcedureVo procedureVo);

}
