package com.dalbit.connect.dao;

import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.connect.vo.procedure.P_ConnectNonBroadOutDetailVo;
import com.dalbit.connect.vo.procedure.P_UserCurrentOutputVo;
import com.dalbit.connect.vo.procedure.P_UserTotalOutDetailVo;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Repository
public interface Con_UserDao {

    @Transactional(readOnly = true)
    List<P_UserTotalOutDetailVo> callUserTotal(ProcedureVo procedureVo);

    @Transactional(readOnly = true)
    ArrayList<P_UserCurrentOutputVo> callUserCurrent(ProcedureVo procedureVo);

    @Transactional(readOnly = true)
    List<P_ConnectNonBroadOutDetailVo> callCurrentLiveSummary(ProcedureVo procedureVo);
}
