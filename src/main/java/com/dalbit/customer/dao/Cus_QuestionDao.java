package com.dalbit.customer.dao;

import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.customer.vo.FaqVo;
import com.dalbit.customer.vo.procedure.P_QuestionDeleteVo;
import com.dalbit.customer.vo.procedure.P_QuestionDetailOutputVo;
import com.dalbit.customer.vo.procedure.P_QuestionListInputVo;
import com.dalbit.customer.vo.procedure.P_QuestionListOutputVo;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Repository
public interface Cus_QuestionDao {

    @Transactional(readOnly = true)
    ArrayList<P_QuestionListOutputVo> callQuestionList(ProcedureVo procedureVo);

    @Transactional(readOnly = true)
    P_QuestionDetailOutputVo callServiceCenterQnaDetail(ProcedureVo procedureVo);

    ProcedureVo callServiceCenterQnaOperate(ProcedureVo procedureVo);

    @Transactional(readOnly = true)
    List<FaqVo> getFaqGroupList();

    @Transactional(readOnly = true)
    List<FaqVo> getFaqSubList(FaqVo faqVo);

    @Transactional(readOnly = true)
    HashMap<P_QuestionListOutputVo,String> callQuestionCountTarget(P_QuestionListInputVo pQuestionListInputVo);

    int callQuestionDelete(P_QuestionDeleteVo pQuestionDeleteVo);
}
