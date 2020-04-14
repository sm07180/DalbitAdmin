package com.dalbit.customer.dao;

import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.customer.vo.FaqVo;
import com.dalbit.customer.vo.procedure.P_QuestionDetailOutputVo;
import com.dalbit.customer.vo.procedure.P_QuestionListInputVo;
import com.dalbit.customer.vo.procedure.P_QuestionListOutputVo;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Repository
public interface Cus_QuestionDao {
    ArrayList<P_QuestionListOutputVo> callQuestionList(ProcedureVo procedureVo);

    P_QuestionDetailOutputVo callServiceCenterQnaDetail(ProcedureVo procedureVo);
    ProcedureVo callServiceCenterQnaOperate(ProcedureVo procedureVo);
    List<FaqVo> getFaqGroupList();
    List<FaqVo> getFaqSubList(FaqVo faqVo);

    HashMap<P_QuestionListOutputVo,String> callQuestionCountTarget(P_QuestionListInputVo pQuestionListInputVo);
}
