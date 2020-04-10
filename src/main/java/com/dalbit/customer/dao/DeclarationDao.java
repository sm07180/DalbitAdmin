package com.dalbit.customer.dao;

import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.customer.vo.procedure.*;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.HashMap;

@Repository
public interface DeclarationDao {
    ArrayList<P_DeclarationListOutputVo> callServiceCenterReportList(ProcedureVo procedureVo);
    P_DeclarationDetailOutputVo callServiceCenterReportDetail(ProcedureVo procedureVo);
    ProcedureVo callServiceCenterReportOperate(ProcedureVo procedureVo);
    ProcedureVo callServiceCenterReportOpCount(ProcedureVo procedureVo);
    HashMap<P_DeclarationOpCountVo,String> callServiceCenterReportOpCountTarget(P_DeclarationOperateCntInputVo pDeclarationOperateCntInputVo);
}
