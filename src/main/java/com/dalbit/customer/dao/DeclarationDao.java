package com.dalbit.customer.dao;

import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.customer.vo.procedure.P_DeclarationOutputListVo;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

@Repository
public interface DeclarationDao {
    ArrayList<P_DeclarationOutputListVo> callServiceCenterReportList(ProcedureVo procedureVo);

}
