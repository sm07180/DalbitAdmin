package com.dalbit.main.dao;

import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.main.vo.procedure.P_BroadStatusOutVo;
import com.dalbit.main.vo.procedure.P_ChartStatusOutVo;
import com.dalbit.main.vo.procedure.P_JoinStatusOutVo;
import com.dalbit.main.vo.procedure.P_TotalStatusOutVo;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public interface Mai_MainStatusDao {

    @Transactional(readOnly = true)
    List<P_TotalStatusOutVo>  callTotalStatusList(ProcedureVo procedureVo);

    @Transactional(readOnly = true)
    List<P_JoinStatusOutVo>  callJoinStatusList(ProcedureVo procedureVo);

    @Transactional(readOnly = true)
    List<P_JoinStatusOutVo>  callWithdrawStatusList(ProcedureVo procedureVo);

    @Transactional(readOnly = true)
    List<P_BroadStatusOutVo>  callBroadStatusInfoList(ProcedureVo procedureVo);

    @Transactional(readOnly = true)
    List<P_ChartStatusOutVo>  callChartStatusInfoList(ProcedureVo procedureVo);
}
