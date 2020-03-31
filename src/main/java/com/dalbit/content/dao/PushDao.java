package com.dalbit.content.dao;

import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.content.vo.procedure.P_pushDetailOutputVo;
import com.dalbit.content.vo.procedure.P_pushListOutputVo;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

@Repository
public interface PushDao {
    ArrayList<P_pushListOutputVo> callServiceCenterPushList(ProcedureVo procedureVo);
    P_pushDetailOutputVo callServiceCenterPushListDetail(ProcedureVo procedureVo);
    ProcedureVo callServiceStmpPushAdd(ProcedureVo procedureVo);
    ProcedureVo callServiceCenterPushUpdate(ProcedureVo procedureVo);
    ProcedureVo callServiceCenterPushDelete(ProcedureVo procedureVo);
}
