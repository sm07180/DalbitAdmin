package com.dalbit.administrate.dao;

import com.dalbit.administrate.vo.procedure.P_FaqListDetailOutputVo;
import com.dalbit.administrate.vo.procedure.P_FaqListOutputVo;
import com.dalbit.common.vo.ProcedureVo;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

@Repository
public interface Adm_FaqDao {
    ArrayList<P_FaqListOutputVo> callFaqList(ProcedureVo procedureVo);
    P_FaqListDetailOutputVo callFaqListDetail(ProcedureVo procedureVo);
    ProcedureVo callFaqAdd(ProcedureVo procedureVo);
    ProcedureVo callFaqUpdate(ProcedureVo procedureVo);
    ProcedureVo callFaqDelete(ProcedureVo procedureVo);
}
