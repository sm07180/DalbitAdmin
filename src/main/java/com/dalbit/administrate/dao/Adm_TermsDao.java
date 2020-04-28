package com.dalbit.administrate.dao;

import com.dalbit.administrate.vo.procedure.P_TermsDetailInputVo;
import com.dalbit.administrate.vo.procedure.P_TermsListInputVo;
import com.dalbit.administrate.vo.procedure.P_TermsListOutputVo;
import com.dalbit.common.vo.ProcedureVo;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

@Repository
public interface Adm_TermsDao {
    ArrayList<P_TermsListOutputVo> callTermsList(P_TermsListInputVo pTermsListInputVo);
    int callTermsList_totalCnt(P_TermsListInputVo pTermsListInputVo);
    int callTermsUpdate(P_TermsDetailInputVo pTermsDetailInputVo);
    int callTermsInsert(P_TermsDetailInputVo pTermsDetailInputVo);
    int callTermsDelete(P_TermsDetailInputVo pTermsDetailInputVo);
}
