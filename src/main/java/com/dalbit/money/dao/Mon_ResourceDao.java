package com.dalbit.money.dao;

import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.money.vo.procedure.P_ResourceDetailByeolOutVo;
import com.dalbit.money.vo.procedure.P_ResourceDetailDalOutVo;
import com.dalbit.money.vo.procedure.P_ResourceInfoInPutVo;
import com.dalbit.money.vo.procedure.P_ResourceInfoOutVo;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;

@Repository
public interface Mon_ResourceDao {

    @Transactional(readOnly = true)
    P_ResourceInfoOutVo callResourceInfo_dal(ProcedureVo procedureVo);

    @Transactional(readOnly = true)
    P_ResourceInfoOutVo callResourceInfo_byeol(ProcedureVo procedureVo);

    @Transactional(readOnly = true)
    ArrayList<P_ResourceDetailDalOutVo> callResourceDetail_dal(ProcedureVo procedureVo);

    @Transactional(readOnly = true)
    ArrayList<P_ResourceDetailByeolOutVo> callResourceDetail_byeol(ProcedureVo procedureVo);

}
