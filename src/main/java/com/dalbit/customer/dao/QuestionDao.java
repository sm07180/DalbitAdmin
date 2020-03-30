package com.dalbit.customer.dao;

import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.customer.vo.QuestionVo;
import com.dalbit.customer.vo.procedure.P_QuestionDetailOutputVo;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface QuestionDao {
    List<QuestionVo> questionList(QuestionVo questionVo);
    int questionList_cnt(QuestionVo questionVo);

    P_QuestionDetailOutputVo callServiceCenterQnaDetail(ProcedureVo procedureVo);
    ProcedureVo callServiceCenterQnaOperate(ProcedureVo procedureVo);
}
