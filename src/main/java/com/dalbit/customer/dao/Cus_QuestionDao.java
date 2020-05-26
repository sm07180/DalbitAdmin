package com.dalbit.customer.dao;

import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.customer.vo.FaqVo;
import com.dalbit.customer.vo.procedure.*;
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
    int callServiceCenterQnaUpdate(P_QuestionOperateVo pQuestionOperateVo);

    @Transactional(readOnly = true)
    List<FaqVo> getFaqGroupList();

    @Transactional(readOnly = true)
    List<FaqVo> getFaqSubList(FaqVo faqVo);

    @Transactional(readOnly = true)
    HashMap<P_QuestionListOutputVo,String> callQuestionCountTarget(P_QuestionListInputVo pQuestionListInputVo);

    int callQuestionDelete(P_QuestionDeleteVo pQuestionDeleteVo);

    @Transactional(readOnly = true)
    int callServiceCenterQnaStateCheck(P_QuestionOperateVo pQuestionOperateVo);

    int callServiceCenterQnaCatch(P_QuestionOperateVo pQuestionOperateVo);
    int callServiceCenterQnaChatchRelease(P_QuestionOperateVo pQuestionOperateVo);
    int callServiceCenterQnaChatchRelease_all(P_QuestionOperateVo pQuestionOperateVo);
}
