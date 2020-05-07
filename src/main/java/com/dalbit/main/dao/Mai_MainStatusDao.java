package com.dalbit.main.dao;

import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.main.vo.procedure.P_BroadStatusOutVo;
import com.dalbit.main.vo.procedure.P_ChartStatusOutVo;
import com.dalbit.main.vo.procedure.P_JoinStatusOutVo;
import com.dalbit.main.vo.procedure.P_TotalStatusOutVo;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface Mai_MainStatusDao {

    List<P_TotalStatusOutVo>  callTotalStatusList(ProcedureVo procedureVo);
    List<P_JoinStatusOutVo>  callJoinStatusList(ProcedureVo procedureVo);
    List<P_JoinStatusOutVo>  callWithdrawStatusList(ProcedureVo procedureVo);
    List<P_BroadStatusOutVo>  callBroadStatusInfoList(ProcedureVo procedureVo);
    List<P_ChartStatusOutVo>  callChartStatusInfoList(ProcedureVo procedureVo);
}
