package com.dalbit.money.dao;

import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.money.vo.procedure.*;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;

@Repository
public interface Mon_ResourceDao {

    @Transactional(readOnly = true)
    ArrayList<P_ResourceDetailDalOutVo> callResourceDetail_dal(ProcedureVo procedureVo);

    @Transactional(readOnly = true)
    ArrayList<P_ResourceDetailByeolOutVo> callResourceDetail_byeol(ProcedureVo procedureVo);

    @Transactional(readOnly = true)
    ArrayList<P_memberDataListOutVo> callMemberDataList(ProcedureVo procedureVo);

}
