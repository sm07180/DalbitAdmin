package com.dalbit.administrate.dao;

import com.dalbit.administrate.vo.procedure.P_FaqListDetailOutputVo;
import com.dalbit.administrate.vo.procedure.P_FaqListOutputVo;
import com.dalbit.common.vo.ProcedureVo;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;

@Repository
public interface Adm_FaqDao {

    @Transactional(readOnly = true)
    ArrayList<P_FaqListOutputVo> callFaqList(ProcedureVo procedureVo);

    @Transactional(readOnly = true)
    P_FaqListDetailOutputVo callFaqListDetail(ProcedureVo procedureVo);

    ProcedureVo callFaqAdd(ProcedureVo procedureVo);
    ProcedureVo callFaqUpdate(ProcedureVo procedureVo);
    ProcedureVo callFaqDelete(ProcedureVo procedureVo);
}
