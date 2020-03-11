package com.dalbit.customer.dao;

import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.customer.vo.procedure.P_DeclarationDetailOutputVo;
import com.dalbit.customer.vo.procedure.P_DeclarationListOutputVo;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

@Repository
public interface DeclarationDao {
    ArrayList<P_DeclarationListOutputVo> callServiceCenterReportList(ProcedureVo procedureVo);
    P_DeclarationDetailOutputVo callServiceCenterReportDetail(ProcedureVo procedureVo);
}
